require 'spec_helper'

describe TrashMan do
  before(:each) do
    @trashman = TrashMan.new(:firstName => "Bob")
    @trashman.id = "1"
  end

  it "should translate firstName to first_name" do
  	expect(@trashman.firstName).to eq @trashman.first_name
  end

  #it "should give an Integer as an :id" do
  #  expect(@trashman.id).to be_kind_of Integer
  #end
end