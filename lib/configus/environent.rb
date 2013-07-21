module Configus
  class Environment
    def initialize
      @env ||= {}
    end

    def method_missing(name, *args, &block)
      if block.nil?
        @env[name] = args.first
      else
        @env[name] = Environment.new.build &block
      end
    end

    def build(env = {}, &block)
      instance_eval &block if block_given?
      @env
    end
  end
end