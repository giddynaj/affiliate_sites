class Stage < ActiveRecord::Base
  belongs_to :client
  belongs_to :client_version
end
