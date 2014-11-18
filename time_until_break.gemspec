# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_until_break/version'

Gem::Specification.new do |spec|
  spec.name          = "time_until_break"
  spec.version       = TimeUntilBreak::VERSION
  spec.authors       = ["Stephen Giles"]
  spec.email         = [""]
  spec.summary       = "A gem which tells you how long until the mandatory break at Makers Academy."
  spec.description   = "This is my second gem which will be available in the command line and which will tell Makers Academy students how long it is until the Mandatory Break at 4:45pm."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "delorean"
end
