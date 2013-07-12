require 'spec_helper'

describe Hashie::Clash do
  before(:each) do
    @c = Hashie::Clash.new
  end

  it "should add pair key-valye" do
    @c.something("def")
    expect(@c).to eq ({:something => "def"})
  end

  it "should have some_hash" do
  	@c.where(:abc => 'def').order(:created_at)
    some_hash = {:where => {:abc => 'def'}, :order => :created_at}
  	expect(@c).to eq some_hash
  end

  it "should set several values if method name includes !" do
  	@c.where!.abc('def').ghi(123)._end!.order(:created_at)
    some_hash = {:where => {:abc => 'def', :ghi => 123}, :order => :created_at}
  	expect(@c).to eq some_hash
  end

  it "should merge hashies if keys are equal" do
  	@c.where(:abc => 'def').where(:hgi => 123)
  	some_hash = {:where => {:abc => 'def', :hgi => 123}}
  	expect(@c).to eq some_hash
  end
end