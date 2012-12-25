# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'couchdb_acts_as_list/version'

Gem::Specification.new do |gem|
  gem.name          = "couchdb_acts_as_list"
  gem.version       = CouchdbActsAsList::VERSION
  gem.authors       = ["Ivan Rostovsky"]
  gem.email         = ["ivan.rostovsky@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{Implementation of the acts as list gem for CouchDB}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
