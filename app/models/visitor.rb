class Visitor < ActiveRecord::Base
  attr_accessor :current_action
  has_many :visits
  has_many :events
  belongs_to :client
  belongs_to :client_version

  def update_stage(session,params)
    #TODO Figure out stage or action session or accessor
    @current_action ||= params[:action]
    visits.create(:stage_id => client_version.stages.where(:name => @current_action).try(:first).try(:id))
  end

  def update_events(session, params)
    events.create()
  end
end
