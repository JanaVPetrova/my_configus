module Configus
  class Builder
    def initialize
      @settings = {}
      @current_env
    end

    def build(env, &block)
      @current_env = env
      instance_eval &block if block_given?

      if has_env? env
        @settings[env]
      else
        raise "No environment: #{env}"
      end
    end

    private
    def env(name, options = {}, &block)
      @settings[name] = Environment.new &block

      define_singleton_method name do
        @settings[name]
      end

      @settings
    end

    def has_env?(env)
      @settings.has_key? env
    end
  end
end