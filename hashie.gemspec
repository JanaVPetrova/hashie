# coding: utf-8
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$:.push File.expand_path("../lib", __FILE__)
require 'hashie/version'
require 'hashie/mash'

Gem::Specification.new do |spec|
  spec.name          = "hashie"
  spec.version       = Hashie::VERSION
  spec.authors       = ["JanaVPetrova"]
  spec.email         = ["janavpetrova@gmail.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "redcarpet", "~> 1.17"
  spec.add_development_dependency "yard", "~> 0.7.5"
  spec.add_development_dependency "rspec-core", "~> 2.0"
  spec.add_development_dependency "rspec-expectations", "~> 2.0"
  spec.add_development_dependency "rr", "~> 1.0"
end