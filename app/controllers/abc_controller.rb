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
  if params['type'] == 'submit'
    #Test validations
    #
    FormSubmission.create(:visitor_id => @visitor.id, :data => params)
    render :text => "{\"url\":\"/thankyou\"}"
  else 
  render :text => "{\"action\":\"/nothing\"}"
  end
  #is form field event
  #is submit event
  #
  #params['type'] handle submit and event
  #params['lastname'] handle different types of actions
  #autocorrect / typos / validation
end

end
end

def index
@fg = @visitor.client_version.stages.find_by_name('index').form_field_group
@visitor.client_version.stages.find_by_name('index').form_field_group.form_fields.to_json(:include => :options_group)
end

def thankyou 
end

end
