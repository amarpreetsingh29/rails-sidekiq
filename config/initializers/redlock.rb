$lock_manager = Redlock::Client.new([$redis_url])
