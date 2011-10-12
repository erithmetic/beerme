$:.push File.expand_path("../lib", __FILE__)
require 'beerme/version'

Gem::Specification.new do |s|
  s.name = 'beerme'
  s.version = BeerMe::VERSION
  s.date = "2011-10-11"
  s.authors = ['Derek Kastner']
  s.email = 'dkastner@gmail.com'
  s.homepage = 'http://github.com/dkastner/beerme'
  s.summary = 'Beer'
  s.description = 'Beer'
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = [ "README.markdown" ]

  s.require_paths = ['lib']
  s.executables = ['beerme']
  s.default_executable = 'beerme'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_runtime_dependency 'charisma'
  s.add_runtime_dependency 'leap'
  s.add_development_dependency 'rspec', '~> 2.0.0'
end

