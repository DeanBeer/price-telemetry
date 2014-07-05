class DeferredGarbageCollection

  THRESHOLD = (ENV['DEFER_GC'] || 15.0).to_f

  @@last_gc_run = Time.now

  class << self

    def start
      GC.disable if THRESHOLD > 0
    end


    def reconsider
      cycle_gc if time_to_cycle?
    end


    def threshold
      THRESHOLD
    end

  private

    def cycle_gc
      GC.enable
      GC.start
      GC.disable
      @@last_gc_run = Time.now
    end


    def last_run_interval
      Time.now - @@last_gc_run
    end


    def time_to_cycle?
      threshold > 0 && last_run_interval >= threshold
    end

  end
end
