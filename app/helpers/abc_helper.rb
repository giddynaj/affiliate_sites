module AbcHelper

def form_field_helper(form_field, options=nil)
  if !form_field.nil?
 
  #html_class = options[:class] if options.class == Hash

  case form_field.html_type
  when 'text'
    text_field_tag(form_field.name, nil, options )
  when 'select'
    select_tag(form_field.name, options_for_select(form_field.get_options_group_values), options )
  when 'multi_select'
    select_tag(form_field.name, options_for_select(form_field.get_options_group_values), options )
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

