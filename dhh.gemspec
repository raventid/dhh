# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dhh/version'

Gem::Specification.new do |spec|
  spec.name          = "dhh"
  spec.version       = Dhh::VERSION
  spec.authors       = ["raventid"]
  spec.email         = ["juliankul@gmail.com"]

  spec.summary       = %q{RAD web-application framework for Ruby}
  spec.description   = %q{Web-application framework written in Ruby, which balance between RAD and ugly architecture solutions.}
  spec.homepage      = "https://github.com/raventid/dhh_magic"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "test-unit"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "erubis"
end
