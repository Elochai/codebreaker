# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = "codebreaker"
  spec.version       = Codebreaker::VERSION
  spec.authors       = ["Bohdan Cherevatenko"]
  spec.email         = ["buu9992@gmail.com"]
  spec.description   = %q{Codebreaker is a logic game in which a code-breaker tries to break a secret code created by a code-maker. The code-maker, which will be played by the application we’re going to write, creates a secret code of four numbers between 1 and 6.

The code-breaker then gets some number of chances to break the code. In each turn, the code-breaker makes a guess of four numbers. The code-maker then marks the guess with up to four + and - signs.

A + indicates an exact match: one of the numbers in the guess is the same as one of the numbers in the secret code and in the same position.

A - indicates a number match: one of the numbers in the guess is the same as one of the numbers in the secret code but in a different position.}
  spec.summary       = %q{Simple logic game based on numbers guessing :)}
  spec.homepage      = "https://github.com/Elochai/codebreaker.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
