class ClientVersion < ActiveRecord::Base
  belongs_to :client
  has_many :stages
  has_many :visitors
end
