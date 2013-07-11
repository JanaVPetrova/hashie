require 'spec_helper'

describe TrashMan do
  before(:each) do
    @trashman = TrashMan.new(:firstName => "Bob")
    @trashman.id = "1"
    @trashman.created_at = Time.now.to_s
  end

  it "should translate firstName to first_name" do
  	expect(@trashman.firstName).to eq @trashman.first_name
  end

  it "should give an Integer as an :id" do
    expect(@trashman.id).to be_kind_of Fixnum
  end

  it "should give :created_at as Time" do
  	expect(@trashman.created_at).to be_kind_of Time
  end

  it "should give :id class" do
    expect(@trashman.id.class).to eq Fixnum
  end
end