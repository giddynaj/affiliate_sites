module AbcHelper

def form_field_helper(form_field, options=nil)
  if !form_field.nil?
 
  #html_class = options[:class] if options.class == Hash

  case form_field.html_type
  when 'text'
    text_field_tag(form_field.name, nil, options )
  when 'select'
    select_tag(form_field.name, options_for_select(form_field.options_group.pluck(:value)), options )
  when 'multi_select'
    select_tag(form_field.name, options_for_select(form_field.options_group.pluck(:value)), options )
  end
  end
  end
end
