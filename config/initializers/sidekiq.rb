sidekiq_redis_url = "#{ENV['REDIS_PROTOCOL']}://#{ENV['REDIS_SIDEKIQ_HOST']}:#{ENV['REDIS_SIDEKIQ_PORT']}/#{ENV['REDIS_SIDEKIQ_DB']}"

Sidekiq.configure_server do |config|
  config.redis = { url:sidekiq_redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: sidekiq_redis_url }
end
