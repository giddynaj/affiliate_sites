class VisitorProperty < ActiveRecord::Base
  belongs_to :visitor

#record anything that is specific to visitor
# zipcode
# device type
  def self.set_device_type(ua)
   if /Mobile|iP(hone|od|ad)|Android|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/.match(ua)
     self.create!(key: 'device_type',  value: 'mobile')
   else
     self.create!(key: 'device_type', value: 'desktop')
   end
  end
  
  def self.set_connection_type(ip)
    ct = ConnectionType.new
    lu = ct.db.lookup(ip)
    if lu.found?
      self.create!(key: 'connection_type', value: lu.connection_type)
    else
      self.create!(key: 'connection_type', value: 'not found')
    end
  end

  def self.set_traffic_type(params)
  #http://pixel.autoaffiliatenetwork.com/d/?id=186679765004&m={MatchType}&creativeID={AdId}&oID={OrderItemId}&q={QueryString}&dest=APF&bm={BidMatchType}&device={device}
#  
  ["id", "m", "creativeID", "oID", "q", "dest", "bm", "device"].each do |key|
    if (val = params[key])
      self.create!(key: 't_' + key, value: val)
    end
  end
  end

end
