Sidekiq.configure_server do |config|
    config.redis = {url: RedisPool::DEFAULT_HOST}
end

Sidekiq.configure_client do |config|
    config.redis = {url: RedisPool::DEFAULT_HOST}
end
