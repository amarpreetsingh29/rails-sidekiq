Sidekiq.configure_server do |config|
    config.redis = RedisPool.default
end
  
Sidekiq.configure_client do |config|
    config.redis = RedisPool.default
end