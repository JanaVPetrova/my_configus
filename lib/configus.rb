require "configus/version"

module Configus
  autoload 'Builder', "configus/builder"
  autoload 'Environment', "configus/environent"
  autoload 'Config', "configus/config"

  class NoEnvironmentError < RuntimeError; end

  def self.build(*args, &block)
    @conf = Configus::Builder.new
    @conf.build(*args, &block)
  end
end
