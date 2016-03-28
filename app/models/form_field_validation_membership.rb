class FormFieldValidationMembership < ActiveRecord::Base
  belongs_to :form_field_validation
  belongs_to :form_field
end
