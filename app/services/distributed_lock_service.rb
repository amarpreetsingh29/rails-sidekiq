class DistributedLockService
  class << self
    TTL_MS = 10000

    def lock(key, ttl=TTL_MS)
      lock_info = $lock_manager.lock(key, ttl)
      raise LockAcquisitionError, "Unable to lock resource with key: #{key}" unless lock_info

      begin
        yield
      ensure
        $lock_manager.unlock(lock_info)
      end
    end
  end
end

class LockAcquisitionError < StandardError; end
