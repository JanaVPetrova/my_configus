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
      @current_key ||= []
      @current_key << name if block_given?
      instance_eval &block if block_given?
      @hash
    end

    def method_missing (meth, *args, &block)
      if block_given?
        @current_key << meth
        block.call
      end
      navigator
    end

    private
    def add_value_to_hash(hash, meth, *args)
      if hash
        hash.merge!({meth => args.first})
      else
        hash = {meth => args.first}
      end
    end

    def navigator
      current_hash ||= @hash
      @current_key.each do |key|
        current_hash = current_hash[key] unless current_hash[key].nil?
      end
      p current_hash
    end
  end
end