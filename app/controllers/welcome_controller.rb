class WelcomeController < DomainController 
layout :determine_layout

def determine_layout
if @visitor
return @visitor.client_version.stages.first.layout_name
else
return 'welcome'
end
end

end
