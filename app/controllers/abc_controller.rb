class AbcController < DomainController 
layout :determine_layout
before_filter :set_current_action
#before_filter :handle_json

def determine_layout
  if @visitor
    # TODO this assumes the layout to be of the first element
    return @visitor.client_version.stages.first.layout_name
  else
    # TODO should make a default layout. plain vanilla
    return 'abc'
  end
end

# TODO change to current stage. remove ambiguity
def set_current_action
  @visitor.current_action = @_action_name
end

def handle_json
if request.format == :json
  if ['submit','validate'].include? params['type'] 
  errors = @visitor.validate_fields(params)

  if !errors
    #render move on
    @visitor.set_key_fields(params)
    if params['type'] == 'submit'
    FormSubmission.create(:visitor_id => @visitor.id, :data => params)
    render :text => "[{\"url\":\"/#{@visitor.get_next_stage(@visitor.current_action)}\"}]"
    else
    render :text => "[{\"action\":\"/nothing\"}]"
    end
  else
    render :text => errors.to_json
  end
else 
 render :text => "[{\"action\":\"/nothing\"}]"
end
end  
end

def index
handle_json
@fg = @visitor.client_version.stages.find_by_name('index').form_field_group
end

def form
handle_json
@fg = @visitor.client_version.stages.find_by_name('form').form_field_group
end

def thankyou 
handle_json
end

end
