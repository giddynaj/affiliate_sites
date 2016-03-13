module AbcHelper

def form_field_helper(form_field)
  if !form_field.nil?
  case form_field.html_type
  when 'text'
    text_field_tag(form_field.name)
  when 'select'
    select_tag(form_field.name, options_for_select(form_field.options_group.pluck(:value)))
  end
  end
  end
end
