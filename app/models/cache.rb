module Cache
def cache_fetch(key, expires)
   expires = 1.minute if Rails.env.development?
   race = 1.minute
   race = 1.second if Rails.env.development?
   c = Rails.cache.fetch(key)
   if c.nil? & block_given?
     c = yield
     Rails.logger.debug("########Writing to cache " + key.to_s)
     if expires.to_s == 'never'
       Rails.cache.write(key, c)
     else
       Rails.cache.write(key, c, :expires_in => expires, :race_condition_ttl => race)
     end
   else
     Rails.logger.debug("########Fetching from cache " + key.to_s)
   end
c.dup
end
end
