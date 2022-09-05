class BaseWorkerJob
  include Sidekiq::Job

  def perform(*args)
    puts "hello"
    Sidekiq::Client.via(RedisPool.secondary) do
      puts "enqueing CsvWorkerJob"
      CsvWorkerJob.perform_async
    end
  end
end
