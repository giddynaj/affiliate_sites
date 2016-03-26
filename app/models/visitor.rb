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

  def update_stage(session,params)
    #TODO Figure out stage or action session or accessor
    @current_action ||= params[:action]
    visits.create(:stage_id => client_version.stages.find_by_name(@current_action).try(:id))
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
end
