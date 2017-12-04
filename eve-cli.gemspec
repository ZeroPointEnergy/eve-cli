lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eve/cli/version'

Gem::Specification.new do |spec|
  spec.name = 'eve-cli'
  spec.version = Eve::Cli::VERSION
  spec.authors = ['Andreas Zuber']
  spec.email = ['zuber@puzzle.ch']

  spec.summary = 'EVE Online command-line interface (ESI API)'
  spec.description = 'This is a command-line tool to do various things'\
                     'with the EVE ESI API'
  spec.homepage = 'https://github.com/ZeroPointEnergy/eve-cli'

  spec.files = `git ls-files -z`.split("\x0")
                                .reject { |f|
                                  f.match(%r{^(test|spec|features)/})
                                }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'gli', '~> 2'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.51'
end
