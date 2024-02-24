class BaseWorkerJob
  include Sidekiq::Job

  def self.perform_async(*args)
    redis_pool = RedisPool.default_pool

    client = Sidekiq::Client.new(pool: redis_pool)
    client.push('class'=>self.name, 'args'=> args)
  end
end
