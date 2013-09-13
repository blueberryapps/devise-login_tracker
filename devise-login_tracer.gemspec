# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/login_tracer/version'

Gem::Specification.new do |spec|
  spec.name          = "devise-login_tracer"
  spec.version       = Devise::LoginTracer::VERSION
  spec.authors       = ["Jiří Zajpt"]
  spec.email         = ["jzajpt@blueberry.cz"]
  spec.description   = %q{Creates a record for each user login}
  spec.summary       = %q{Creates a record for each user login}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', "~> 1.3"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
