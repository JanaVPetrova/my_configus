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

    def env(name, options = {}, &block)
      @hash[name.to_sym] ||= options if options.any?
      @current_key = name if block_given?
      instance_eval &block if block_given?
      @hash
    end

    def method_missing (meth, *args, &block)
      if @hash[@current_key]
        @hash[@current_key].merge!({meth => args.first})
      else
        @hash[@current_key] = {meth => args.first}
      end
    end

  end
end