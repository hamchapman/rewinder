require 'date'
require "#{File.expand_path(File.dirname(__FILE__))}/lib/rewinder/version"

Gem::Specification.new do |s|
  s.name           = 'rewinder'
  s.version        = '0.0.2'
  s.date           = Date.today.to_s
  s.summary        = "Rewinder"
  s.description    = "Rewinder goes back through the git history of your site and creates a timelapse video showing how it's changed visually"
  s.authors        = ["Hamilton Chapman"]
  s.email          = 'hamchapman@gmail.com'
  s.files          = `git ls-files`.split($\)
  s.executables    = ['rewinder']
  s.homepage       = 'http://rewinder.io'
  s.license        = 'MIT'
  s.require_paths  = ['lib']
  s.add_dependency 'git'
end