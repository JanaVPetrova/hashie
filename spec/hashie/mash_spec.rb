require 'spec_helper'

describe Hashie::Mash do
  before(:each) do
    @mash = Hashie::Mash.new
  end

  it "should return false if .key? is missing" do
    expect(@mash.name?).to eq false
  end

  it "should check if key exists" do
    @mash.name = "john"
    expect(@mash.name?).to eq true
  end

  it "should return nil if .key is missing" do
    expect(@mash.name).to eq nil
  end

  it "should return value if key is known" do
    @mash.name = "john"
    expect(@mash.name).to eq "john"
  end

  it "should add pair key-value" do
    @mash.key = "value"
    expect(@mash.key("value")).to eq "value"
  end

  it "should print self" do
    @mash.name = "john"
    @mash.fruit = "apple"
    expect(@mash.inspect).to eq "Hashie::Mash name=\"john\" fruit=\"apple\""
  end

  it "should create second level mash" do
    @mash.author!
    expect(@mash.author).to be_a_kind_of Hashie::Mash
  end

  it "should inspect second level mash" do
    @mash.author!
    expect(@mash.author.inspect).to eq "Hashie::Mash"
  end

  #it "should add key-value to second level mash" do
  #  @mash.author!.name = "John Smith"
  #  expect(@mash.author).to eq "Hashie::Mash name=\"John Smith\""
  #end
end