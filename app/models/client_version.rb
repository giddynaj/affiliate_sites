class ClientVersion < ActiveRecord::Base
  belongs_to :client
  has_many :visitors

  def stages 
    Stage.where("client_id = ? and client_version_id = ?", self.client_id, self.id)
  end
end
