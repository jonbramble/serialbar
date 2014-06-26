# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'serialbar/version'

Gem::Specification.new do |spec|
  spec.name          = "serialbar"
  spec.version       = Serialbar::VERSION
  spec.date          = '2014-06-20'
  spec.summary       = "An adapter gem between incomming serial port data and storage"
  spec.description   = "Parse and save incoming data to storage, default mongodb"
  spec.authors       = ["Jonathan Bramble"]
  spec.email         = ["jbramble82@hotmail.com"]
  spec.homepage      = 'https://github.com/jonbramble/serialbar/'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  spec.add_development_dependency "mongoid", "~> 3.1", '>= 3.1.6'

  spec.add_development_dependency "data_mapper", '~> 1.2.0'

  spec.add_runtime_dependency "serialport", '~> 1.3', '>= 1.3.0'
  spec.add_runtime_dependency "thor", '~> 0.19', '>= 0.19.1'
  spec.add_runtime_dependency "timers", '~> 3.0', '>= 3.0.0'
end
