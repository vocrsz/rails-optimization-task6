Influxer.configure do |config|
  config.username = 'root'
  config.password = 'root'
  config.database = 'db'
  config.hosts = ['influxdb']
  config.port = 8086 # Default port
end
