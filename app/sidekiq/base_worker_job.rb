class BaseWorkerJob
  include Sidekiq::Job

  POOL = {
    "Etl::LoadJob"=> RedisPool.secondary_pool
  }

  def self.perform_async(*args)
    redis_pool = POOL[self.name] || RedisPool.default_pool

    client = Sidekiq::Client.new(pool: redis_pool)
    client.push('class'=>self.name, 'args'=> args)
  end
end
