$redis_url = "#{ENV['REDIS_PROTOCOL']}://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}/#{ENV['REDIS_DB']}"
$sidekiq_redis_url = "#{ENV['REDIS_PROTOCOL']}://#{ENV['REDIS_SIDEKIQ_HOST']}:#{ENV['REDIS_SIDEKIQ_PORT']}/#{ENV['REDIS_SIDEKIQ_DB']}"
$webhooks_redis_url = "#{ENV['REDIS_PROTOCOL']}://#{ENV['REDIS_SIDEKIQ_WEBHOOKS_HOST']}:#{ENV['REDIS_SIDEKIQ_WEBHOOKS_PORT']}/#{ENV['REDIS_SIDEKIQ_WEBHOOKS_DB']}"

class RedisPool
  class << self
    attr_reader :default_pool, :webhooks_pool

    def init
      @default_pool = connection_pool($sidekiq_redis_url)
      @webhooks_pool = connection_pool($webhooks_redis_url)
    end

    private

    def connection_pool(redis_url)
      ConnectionPool.new(size: 25) do
          Redis.new(url: redis_url)
      end
    end
  end
end

RedisPool.init
