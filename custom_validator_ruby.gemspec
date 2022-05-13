require_relative 'lib/custom_validator_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "custom_validator_ruby"
  spec.version       = CustomValidatorRuby::VERSION
  spec.authors       = ["SergeyProger"]
  spec.email         = ["kogutsergey1@gmail.com"]

  spec.summary       = %q{Using pure Ruby without Rails Implement custom Validation module}
  spec.description   = %q{Include this module to your classes and demonstrate the validation usage.}
  spec.homepage      = "https://github.com/SergeyProger/custom_validator_ruby"
  spec.license       = "MIT"
  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['README.md', 'LICENSE', 'lib/**/*.rb',               
                   'custom_validator_ruby.gemspec', '.github/*.md',
                   'Gemfile', 'lib/custom_validator_ruby.rb']
  spec.bindir        = "exe"
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths = ["lib"]
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rake'
end
