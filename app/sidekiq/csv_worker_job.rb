class CsvWorkerJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    puts "CsvWorkerJob started"
  end
end
