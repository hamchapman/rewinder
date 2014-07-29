require 'date'
require "#{File.expand_path(File.dirname(__FILE__))}/lib/rewinder/version"

Gem::Specification.new do |s|
  s.name           = 'rewinder'
  s.version        = '0.0.1'
  s.date           = Date.today.to_s
  s.summary        = "Rewinder"
  s.description    = "A simple hello world rewinder gem"
  s.authors        = ["Hamilton Chapman"]
  s.email          = 'hamchapman@gmail.com'
  s.files          = `git ls-files`.split($\)
  s.executables    = ['rewinder']
  s.homepage       = 'http://rubygems.org/gems/rewinder'
  s.license        = 'MIT'
  s.require_paths  = ['lib']
  s.add_dependency 'git'
end

