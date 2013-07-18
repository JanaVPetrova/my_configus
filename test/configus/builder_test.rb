require "test_helper"

describe Configus::Builder do
  before do
    @config = Configus::Builder.new
  end

  it "should create hash" do
    @config.build(:develop).must_be_kind_of Hash 
  end
end