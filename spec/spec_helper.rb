require 'simplecov'
SimpleCov.start

require 'bundler/setup'
Bundler.require

require 'rubygems'

require 'rspec'
require 'rspec/autorun'

RSpec.configure do |config|
end

require 'coveralls'
Coveralls.wear!

Dir[File.expand_path('../fixtures/*.rb', __FILE__)].each { |f| require f }