class Visitor < ActiveRecord::Base
  include Cache
  attr_accessor :current_action
  has_many :visits
  has_many :events
  has_many :visitor_properties
  belongs_to :client
  belongs_to :client_version

  def cache_key
  end

  def set_key_fields(data)
  # TODO possible to get duplicate keys, maybe check for uniqueness or select latest if we want the extra data
  if data['email'] 
  self.visitor_properties.create!(key: 'email', value: data['email'])
  end

  if data['zipcode']
  self.visitor_properties.create!(key: 'zipcode', value: data['zipcode'])
  #find city and state
  zc = ZipCode.find_by_zip(data['zipcode'])

  self.visitor_properties.create!(key: 'city', value: zc.city)
  self.visitor_properties.create!(key: 'state_abbr', value: zc.state.state_abbr)
  self.visitor_properties.create!(key: 'state_full', value: zc.state.state_full)
  end
  end

  def citystate
  city = self.visitor_properties.find_by_key('city').try(:value)
  state = self.visitor_properties.find_by_key('state_full').try(:value)
  "#{city.titleize}, #{state.titleize}"
  end

  def update_stage(session,params)
    #TODO Figure out stage or action session or accessor
    @current_action ||= params[:action]
    visits.create(:stage_id => client_version.stages.find_by_name(@current_action).try(:id))
  end

  def validate_fields(params)
    #find pertinent fields
    fields = client_version.stages.find_by_name(@current_action).form_field_group.form_fields
    errors = fields.map {|field|
      field.validate(params[field.name])
    }.delete_if { | error | error.empty? }
    
    return errors.empty? ? false : errors
  end

  def get_next_stage(current_action)
      cache_fetch(client_version.id.to_s + '_' + current_action + '_next_stage', 'never') do
        sequence = client_version.stages.order(:sequence).find_by_name(current_action).try('sequence') rescue nil
        client_version.stages.order(:sequence).find_by_sequence(sequence + 1).try('name') rescue ""
      end
  end

  def update_events(session, params)
    if params['type'] != 'submit'
    key_hash = params.dup
    key_hash.delete_if {|key, value| ['type','controller','action','format'].include?(key)}
    else
    key_hash = nil
    end
    events.create(:event_type => params['type'], :data => key_hash)
  end
private
  
end
