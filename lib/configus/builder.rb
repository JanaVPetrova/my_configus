module Configus
  class Builder
    attr_reader :hash

    def initialize
      @hash = {}
    end

    def build(env, &block)
      instance_eval &block if block_given?
      @hash 
    end

    def env(name, options = {})
      @hash[name.to_sym] = options
      @hash
    end

  end
end