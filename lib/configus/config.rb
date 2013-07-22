module Configus
  class Config
    def initialize(properties)
      (class << self; self; end).class_eval do
        properties.each_pair do |key, value|
          if value.is_a? Hash
            value = Config.new(value)
          end
          define_method key do
            value
          end
        end
      end
    end
  end
end