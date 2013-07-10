require 'spec_helper'

describe Person do
  before(:each) do
    name = "John"
    email = "john@doe.com"
    occupation = "Rubyist"
    @person = Person.new(:name => name)
  end

  it "should raise argument error" do
    expect {Person.new}.to raise_error
  end

  it "should create new person if 'name' exists" do
    expect(@person).not_to eq nil
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

  #it "should raise NoMethodError if property is not defined" do
  #  @person[:awesome]
  #  @person[:name] = "nill"
  #  raise @person.inspect
  #  expect {@person[:awesome]}.to raise_error
  #end

end