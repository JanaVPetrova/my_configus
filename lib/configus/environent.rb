module Configus
  class Environment
    def initialize
      @env ||= {}
    end

    def create_hash(&block)
      instance_eval &block if block_given?
      @env
    end

    def method_missing(name, *args, &block)
      if block.nil?
        @env[name] = args.first
      else
        @env[name] = Environment.new.create_hash &block
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end
  end
end