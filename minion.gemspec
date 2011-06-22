# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'minion/version'

Gem::Specification.new do |s|
  s.name        = "minion"
  s.version     = Minion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Emson"]
  s.email       = ["ben@emson.co.uk"]
  s.homepage    = "https://github.com/emson"
  s.summary     = %q{Minion is a Ruby framework for building mini apps.}
  s.description = %q{Minion provides a framework for building simple apps based on discreet services.}

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"

  s.test_files         = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables        = %w(minion)
  s.require_paths      = ["lib"]
end
