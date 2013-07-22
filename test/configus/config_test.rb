require "test_helper"

describe Configus::Config do
  it "should create method" do
    hash = {ololo: {qwe: "rty", uio: "p"}, asd: "fgh"}
    config = Configus::Config.new(hash)
    config.ololo.qwe.must_equal "rty"
  end
end