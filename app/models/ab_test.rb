class AbTest < ActiveRecord::Base
  include ReportingRecord
  
  has_many :ab_options
  accepts_nested_attributes_for :ab_options
end
