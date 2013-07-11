require 'spec_helper'

describe Person do
  before(:each) do
    @person = Person.new(:name => "John")
  end

  it "should raise argument error" do
    expect { Person.new }.to raise_error(ArgumentError)
  end

  it "should create new person if 'name' exists" do
    expect(@person.name).not_to eq nil
  end

  it "should return name value" do
    expect(@person.name).to eq "John"
  end

  it "should raise argument error if set nill" do
    expect {@person.name = nill}.to raise_error
  end

  it "should set value" do
    @person.email = "abc@def.com"
    expect(@person.email).to eq "abc@def.com"
  end

  it "should set default value" do
    expect(@person.occupation).to eq  "Rubyist"
  end

  it "should raise NoMethodError if property is not defined" do
    expect {@person[:awesome]}.to raise_error(NoMethodError)
  end

  it "should return occupation value" do
    expect(@person[:occupation]).to eq "Rubyist"
  end
end