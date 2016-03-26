class FormFieldGroup < ActiveRecord::Base
  has_many :form_fields, -> { order "form_field_memberships.field_order" }, :through => :form_field_memberships
  has_many :form_field_memberships
  has_many :stages


def next_field
  @current_field ||= 0
  begin
  ff = self.form_fields.find(@current_field + 1)
  rescue
  ff = nil
  else
  @current_field += 1
  end
return ff
end
 
def get_field_by_name(name)
  begin
    ff = self.form_fields.find_by_name(name)
  rescue
    ff = nil
  end

end

end
