module Configus
  class Builder
    attr_reader :hash

    def initialize
      @hash = {}
    end

    def build(env, &block)
      instance_eval &block if block_given?
      @hash[env]
    end

    def env(name, options = {}, &block)
      if options.has_key? :parent
        @hash[name] = @hash[options[:parent]]
      end
      env = Environment.new
      @hash[name] = env.build(&block)
    end
  end
end