class FormFieldValidation < ActiveRecord::Base
  has_many :form_fields, -> { order "form_field_validation_memberships.validation_order" }, :through => :form_field_validation_memberships
  has_many :form_field_validation_memberships


  def test(value)
   self.send(name, value)
  end
  
  def notempty(value)
    return value.to_s != "" ?  nil : "should not be empty"
  end
end
