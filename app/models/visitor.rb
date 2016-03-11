class Visitor < ActiveRecord::Base
  attr_accessor :current_stage
  has_many :visits
  has_many :events
  belongs_to :client
  belongs_to :client_version

  def update_stage(session,params)
    session[:current][:stage] = params[:stage]
    visits.create(:stage_id => client_version.stages.where(:name => params[:stage]).try(:first).try(:id))
  end

  def update_events(session, params)
    events.create()
  end
end
