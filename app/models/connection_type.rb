class ConnectionType
def initialize
  @db = MaxMindDB.new(Rails.root.join('lib/GeoIP2-Connection-Type.mmdb'))
end

def db
  @db
end
end
