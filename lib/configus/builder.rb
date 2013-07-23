require 'active_support/core_ext/hash/deep_merge.rb'

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
        raise Configus::NoEnvironmentError, "Environment '#{env}' does not exist"
      end
    end

    private
    def env(name, options = {}, &block)
      @settings[name] = Environment.new.create_hash &block
      if options.has_key? :parent
        @settings[name] = @settings[options[:parent]].deep_merge @settings[name]
      end
      @settings
    end

    def has_env?(env)
      @settings.has_key? env
    end
  end
end