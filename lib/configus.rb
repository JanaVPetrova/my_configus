require "configus/version"

module Configus
  require "configus/builder"
  require "configus/environent"
  require "configus/config"

  def self.build(*args, &block)
    Configus::Builder.new.build(*args, &block)
  end
end
