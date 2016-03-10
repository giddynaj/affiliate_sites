class Client < ActiveRecord::Base
  has_many :client_versions
  has_many :stages

def get_client_version
  if false #tests available
  else # get default client_version
    ClientVersion.where("client_id = ? and description = 'default'", self.id).try(:first).try(:id)
  end
end

end
