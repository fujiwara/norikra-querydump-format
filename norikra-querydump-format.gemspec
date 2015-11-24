# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'norikra/querydump/format/version'

Gem::Specification.new do |spec|
  spec.name          = "norikra-querydump-format"
  spec.version       = Norikra::Querydump::Format::VERSION
  spec.authors       = ["FUJIWARA Shunichiro"]
  spec.email         = ["fujiwara.shunichiro@gmail.com"]

  spec.summary       = %q{Formatter for norikra-client query dump and sync.}
  spec.description   = %q{Formatter for norikra-client query dump and sync.}
  spec.homepage      = "https://github.com/fujiwara/norikra-querydump-format"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
