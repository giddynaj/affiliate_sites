class FormFieldMembership < ActiveRecord::Base
  belongs_to :form_field_group
  belongs_to :form_field
end
