class RedisPool
    class << self
        attr_reader :default_pool

        def init
            @default_pool = connection_pool(ENV['REDIS_URL'])
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
