class ZipCode < ActiveRecord::Base
  has_one :state, primary_key: 'state', foreign_key: 'state_abbr'
end
