class AbOption < ActiveRecord::Base
  include ReportingRecord

  belongs_to :ab_test
end
