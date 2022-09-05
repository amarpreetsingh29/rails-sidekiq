
class RedisPool
    class << self
        attr_reader :default, :secondary

        def init
            redis_hosts = ['redis://localhost:6379', 'redis://localhost:6380']
            @default = connection_pool(redis_hosts[0])
            @secondary = connection_pool(redis_hosts[1])
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