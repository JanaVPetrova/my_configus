require "configus/version"

module Configus
  require "configus/builder"
  require "configus/environent"
  require "configus/config"

  class NoEnvironmentError < RuntimeError; end

  def self.build(*args, &block)
    @conf = Configus::Builder.new
    @conf.build(*args, &block)
  end
end
