class FormField < ActiveRecord::Base
  has_many :form_field_groups, :through => :form_field_memberships
  has_many :validations

  def options_group
    OptionsGroup.where(:group_id => self.options_group_id)
  end
end
