module PriceTelemetry

  class Cache < BasicObject

    include ::Singleton

    def self.configure(&block)
      instance.configure(&block)
    end


    def cacheing?
      !! config[:cacheing]
    end


    def configure(&block)
      config.tap &block
    end


    def fetch(name,options=nil)
      if cacheing?
        cache.fetch name, options
      else
        yield if ::Kernel.block_given?
      end
    end


    def method_missing(name, *args, &block)
      cache.send name, *args, &block
    end


    def respond_to?(*args)
      self_responds_to?(args[0]) or cache.respond_to?(*args)
    end


    def respond_to_missing?(*args)
      self_responds_to?(args[0]) or cache.respond_to_missing?(*args)
    end

  private

    def cacheing=(bool)
      config[:cacheing] = bool
    end


    def config
      @config ||= {
                    cache: ::Rails.cache,
                    cacheing: true
                  }
    end


   def self_responds_to?(name)
     [:cacheing?, :configure, :fetch].include?(name)
   end


    def cache
      @cache ||= config[:cache]
    end

  end
end
