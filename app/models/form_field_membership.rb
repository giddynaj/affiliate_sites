class FormFieldMembership < ActiveRecord::Base
  belongs_to :form_field
  belongs_to :form_field_group
end
