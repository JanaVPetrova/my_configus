module Configus
  class Builder
    def initialize
      @settings = {}
    end

    def build(env, &block)
      instance_eval &block if block_given?

      if has_env? env
        Config.new(@settings[env])
      else
        raise "No environment: #{env}"
      end
    end

    private
    def env(name, options = {}, &block)
      @settings[name] = Environment.new.create_hash &block
      @settings
    end

    def has_env?(env)
      @settings.has_key? env
    end
  end
end