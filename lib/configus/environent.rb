module Configus
  class Environment
    def initialize(&block)
      @env ||= {}
      instance_eval &block if block_given?
      @env
    end

    def method_missing(name, *args, &block)
      if block.nil?
        @env[name] = args.first
      else
        @env[name] =  Environment.new &block
      end
      define_singleton_method name do
        @env[name]
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end
  end
end