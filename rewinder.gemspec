require 'date'
require "#{File.expand_path(File.dirname(__FILE__))}/lib/rewinder/version"

Gem::Specification.new do |s|
  s.name        = 'rewinder'
  s.version     = '0.0.1'
  s.date        = Date.today.to_s
  s.summary     = "Rewinder"
  s.description = "A simple hello world gem"
  s.authors     = ["Hamilton Chapman"]
  s.email       = 'hamchapman@gmail.com'
  s.files         = `git ls-files`.split($\)
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = ['rewinder']
  s.homepage    =
    'http://rubygems.org/gems/rewinder'
  s.license       = 'MIT'
  s.add_runtime_dependency 'git'
  s.require_paths = ['lib']
end

