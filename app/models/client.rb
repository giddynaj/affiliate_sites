class Client < ActiveRecord::Base
  has_many :client_versions
  has_many :stages

end
