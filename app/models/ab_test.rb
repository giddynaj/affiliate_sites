class AbTest < ActiveRecord::Base
  has_many :ab_options
  accepts_nested_attributes_for :ab_options
end
