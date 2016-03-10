class DomainController < ApplicationController
  before_filter :set_current_session
  before_filter :create_visitor
  before_filter :stage_arrival
  before_filter :event_request

  def set_current_session
    session[:current] ||= {}
  end

  def stage_arrival
  if request.format == :html
    #set update stage
    #check flow in session
    @visitor.update_stage(session, params)
    #prep stage initial data
    #render stage
  end
  end

  def event_request
  if request.format == :js || request.format == :json
    #record event request
    @visitor.update_events(session, params)
    #prep requested data
    #render request with flow info
  end
  end

  def create_visitor
    unless cookies[:visitor] && (visitor=Visitor.find_by_id(cookies[:visitor]))
      ip = nil
      begin
        ip = request.remote_ip
      rescue
      end
      client = get_client
      visitor=Visitor.create(:uri => request.fullpath, :ip => ip, :user_agent => request.env['HTTP_USER_AGENT'], :referer => request.env['HTTP_REFERER'], :client_id => client.id, :client => client, :client_version_id => client.get_client_version)
      cookies[:visitor] = { value: visitor.id, expires: 6.hours.from_now }
    end
    #cookie_user
    @visitor = visitor
  end
  
  def get_client
    if !(client = Client.find_by_base_url(request.env['SERVER_NAME'].gsub(/www\./,''))).nil?
      return client 
    else
      return Client.find_by_id(1)
    end
  end

  
end


