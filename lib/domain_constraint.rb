class DomainConstraint
  def initialize
    db_config = Rails.application.config.database_configuration[Rails.env]
    client = Mysql2::Client.new(:host => db_config['host'], :database => Rails.env, :username => db_config['username'], :password => db_config['password'])
    @domains = client.query("select name, base_url from clients where name != 'welcome'")
  end

  def domains
     @domains
  end
end
