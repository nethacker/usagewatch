# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usagewatch/version'

Gem::Specification.new do |spec|
  spec.name          = "usagewatch"
  spec.version       = Usagewatch::VERSION
  spec.authors       = ["Phil Chen, Ruben Espinosa"]
  spec.email         = ["nethacker@gmail.com,rderoldan1@gmail.com"]
  spec.description   = %q{A Ruby Gem with methods to find usage statistics on a Linux server such as CPU, Disk, TCP/UDP Connections, Load, Bandwidth, Disk I/O, and Memory}
  spec.summary       = %q{Statistics on a Linux server}
  spec.homepage      = "https://github.com/nethacker/usagewatch"
  spec.license       = "MIT"
  spec.rdoc_options << '--main' << 'README'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.post_install_message = "* Linux version are covered for our test.\n* Mac OS version is in development\nThanks for installing!"
end
