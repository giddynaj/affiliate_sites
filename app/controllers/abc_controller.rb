class AbcController < DomainController 
layout :determine_layout
before_filter :set_current_action
before_filter :handle_json

def determine_layout
  if @visitor
    return @visitor.client_version.stages.first.layout_name
  else
    return 'abc'
  end
end

def set_current_action
  @visitor.current_action = @_action_name
end

def handle_json
if request.format == :json
case @visitor.current_action
when 'index'
  #params['type'] handle submit and event
  #params['lastname'] handle different types of actions
  #autocorrect / typos / validation

  render :text => "{\"url\":\"/signup\"}"
when 'signup'
  render :text => "{\"url\":\"/carview\"}"
when 'carview'
  render :text => "{\"url\":\"/index\"}"
end

end
end

def index
@fg = @visitor.client_version.stages.find_by_name('index').form_field_group
end

def signup 
end

def carview 

end
end
