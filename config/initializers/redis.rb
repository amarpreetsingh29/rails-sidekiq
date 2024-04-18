class RedisPool
    class << self
        attr_reader :default_pool

        def init
            sidekiq_redis_url = "#{ENV['REDIS_PROTOCOL']}://#{ENV['REDIS_SIDEKIQ_HOST']}:#{ENV['REDIS_SIDEKIQ_PORT']}/#{ENV['REDIS_SIDEKIQ_DB']}"
            @default_pool = connection_pool(sidekiq_redis_url)
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
