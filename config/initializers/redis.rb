
class RedisPool
    DEFAULT_HOST = 'redis://localhost:6379'
    SECONDARY_HOST = 'redis://localhost:6380'

    class << self
        attr_reader :default_pool, :secondary_pool

        def init
            @default_pool = connection_pool(DEFAULT_HOST)
            @secondary_pool = connection_pool(SECONDARY_HOST)
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
