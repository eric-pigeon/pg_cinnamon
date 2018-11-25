
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pg_cinnamon/version"

Gem::Specification.new do |spec|
  spec.name          = "pg_cinnamon"
  spec.version       = PgCinnamon::VERSION
  spec.authors       = ["Eric Pigeon"]
  spec.email         = ["eric.r.pigeon@gmail.com"]

  spec.summary       = %q{Add tsquery to activerecord column}
  spec.description   = %q{Add tsquery to activerecord column}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["source_code_uri"] = "https://github.com/eric-pigeon/pg_cinnamon"
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",    "~> 1.17"
  spec.add_development_dependency "rake",       "~> 10.0"
  spec.add_development_dependency "rspec",      "~> 3.0"
  spec.add_development_dependency 'pg',         '~> 0.19'
  spec.add_development_dependency 'with_model', '~> 2.0'

  spec.add_dependency 'activerecord', '>= 4.0.0'
  spec.add_dependency 'railties', '>= 4.0.0'
end
