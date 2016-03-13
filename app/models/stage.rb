class Stage < ActiveRecord::Base
  belongs_to :client
  belongs_to :client_version
  belongs_to :form_field_group
end
