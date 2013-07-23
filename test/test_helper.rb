require 'bundler/setup'
Bundler.require

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require "minitest/autorun"
require "minitest/spec"