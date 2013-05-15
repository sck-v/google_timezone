# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_timezone/version'

Gem::Specification.new do |gem|
  gem.name          = "google_timezone"
  gem.version       = GoogleTimezone::VERSION
  gem.authors       = ["sck-v"]
  gem.email         = ["kryak.iv@gmail.com"]
  gem.description   = %q{Get timezone info by known coordinates}
  gem.summary       = %q{Small gem to get timezone info by known coordinates using google timezone api.
                        https://developers.google.com/maps/documentation/timezone/}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-mocks'
end
