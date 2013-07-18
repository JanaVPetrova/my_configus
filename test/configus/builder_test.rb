require "test_helper"

describe Configus::Builder do
  before do
    @config = Configus::Builder.new
  end

  it "should create hash" do
    @config.build(:develop).must_be_kind_of Hash 
  end

  it "should add options to environment" do
    expected_hash = {develop: {email: "admin@gmail.com"}}
    @config.env(:develop, email: "admin@gmail.com").must_equal expected_hash
  end

  it "should have blocks" do
    c = Configus::Builder.new
    c.build :development do
      env :production, website_url: 'http://example.com'
    end
    expected_hash = { production: { website_url: "http://example.com"} }
    c.hash.must_equal expected_hash
  end
end