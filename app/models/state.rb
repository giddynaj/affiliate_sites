class State < ActiveRecord::Base
  has_many :zip_codes, primary_key: 'state_abbr', foreign_key: 'state'
end
