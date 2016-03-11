class AbcController < DomainController 
layout :determine_layout
before_filter :set_current_stage
before_filter :handle_json

def determine_layout
  if @visitor
    return @visitor.client_version.stages.first.layout_name
  else
    return 'abc'
  end
end

def set_current_stage
  @visitor.current_stage = @_action_name
end

def handle_json
if request.format == :json
render :text => "{\"url\":\"/signup\"}"
end
end

def index
end

def filter
end

def signup 
end

end
