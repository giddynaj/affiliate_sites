class DefController < DomainController 
layout :determine_layout

def determine_layout
  if @visitor
    return @visitor.client_version.stages.first.layout_name
  else
    return 'def'
  end
end

def index
end

def filter
end

def signup 
if request.format == :json
render :text => "{\"url\":\"/signup\"}"
end
end

end
