require 'spec_helper'

describe Person do
  before(:each) do
    name = "John"
    email = "john@doe.com"
    occupation = "Rubyist"
    #@person = Person.new(:name => name)
  end

  it "should raise argument error" do
    expect {Person.new}.to raise_error
  end

  #it "should create new person if 'name' exists" do
  #  @person = Person.new(:name => "Bob")
  #  expect(@person).not_to eq nil
  #end
end