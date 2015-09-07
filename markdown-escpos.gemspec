# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markdown-escpos/version'

Gem::Specification.new do |spec|
  spec.name          = "markdown-escpos"
  spec.version       = MarkdownEscPos::VERSION
  spec.authors       = ["Nicholas E. Rabenau"]
  spec.email         = ["nerab@gmx.at"]
  spec.summary       = %q{A Markdown to ESC/POS converter}

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

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 4.0'

  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-rack'
  spec.add_development_dependency 'guard-minitest'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-stack_explorer'

  spec.add_development_dependency 'rb-inotify'
  spec.add_development_dependency 'rb-fsevent'
  spec.add_development_dependency 'rb-readline'
end
