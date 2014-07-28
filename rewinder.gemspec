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
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.homepage    =
    'http://rubygems.org/gems/rewinder'
  s.license       = 'MIT'
  s.add_development_dependency 'git'

end

