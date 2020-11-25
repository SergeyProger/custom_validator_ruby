require_relative 'lib/custom_validator_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "custom_validator_ruby"
  spec.version       = CustomValidatorRuby::VERSION
  spec.authors       = ["SergeyProger"]
  spec.email         = ["kogutsergey1@gmail.com"]

  spec.summary       = %q{Using pure Ruby without Rails Implement custom Validation module}
  spec.description   = %q{Include this module to your classes and demonstrate the validation usage.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
