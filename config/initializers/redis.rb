config = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]
$redis = Redis.new(
  :host => config['host'],
  :port => config['port'],
  :logger => Rails.logger
)
