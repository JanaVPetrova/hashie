require 'spec_helper'

describe Mash do
  before(:each) do
    @mash = Mash.new
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
end