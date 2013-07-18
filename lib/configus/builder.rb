module Configus
  class Builder

    def initialize
      @hash = {}
    end

    def build(env)
      @hash[env.to_sym] = {}
      @hash 
    end

    def env(name, options = {})
      @hash[name.to_sym] = options
      @hash
    end

  end
end