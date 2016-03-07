class WelcomeController < DomainController 
layout :determine_layout

def determine_layout
if @visitor
return @visitor.client_version.stages.first.layout_name
else
return 'abc'
end
end

def index
@test = "abc"
end

def filter
  binding.pry
end

def signup 
render :text => "{\"url\":\"/signup\"}"
end

end
