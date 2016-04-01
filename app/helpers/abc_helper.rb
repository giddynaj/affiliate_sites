module AbcHelper

def form_field_helper(form_field, options=nil)
  if !form_field.nil?
 
  #html_class = options[:class] if options.class == Hash

  options = { class: 'u-full-width no-bottom', onchange: 'return changed(this);', required: nil}
  error_div = "<div id=#{form_field.name + '_msg'} class='no-error'></div>"

  #Merge db form field html5 validations
  form_field.form_field_validations.each do |validation|
    html_validation = validation.html_validation
    if !html_validation.nil?
      options.merge!(validation.html_validation)
    end
  end

  case form_field.html_type
  when 'text'
    text_field_tag(form_field.name, nil, options ) + error_div.html_safe
  when 'select'
    select_tag(form_field.name, options_for_select(form_field.get_options_group_values), options ) + error_div.html_safe
  when 'multi_select'
    select_tag(form_field.name, options_for_select(form_field.get_options_group_values), options ) + error_div.html_safe
  end
  end
end

def cache_key_for_abc
# TODO figure out correct way to do cache key
#  count          = Product.count
#  max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
#  "products/all-#{count}-#{max_updated_at}"
end
end

