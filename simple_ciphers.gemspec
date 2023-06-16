# frozen_string_literal: true

require_relative "lib/simple_ciphers/version"

Gem::Specification.new do |spec|
  spec.name = "simple_ciphers"
  spec.version = SimpleCiphers::VERSION
  spec.authors = ["Kuba Jasko"]
  spec.email = ["kubajasko@hotmail.co.uk"]

  spec.summary = "This gem allows you to encode, decode and brute force basic ciphers"
  spec.description = <<DESCRIPTION
    This gem should not be used for production-grade security as the ciphers it implements are very basic.
    It will let you encode, decode and brute force ciphers.
    The brute force will only work if you have enough encoded text.

    Currently the ciphers that are available are:
      - Caesar Cipher
      - Monoalphabetic Cipher
DESCRIPTION
  spec.homepage = "https://github.com/BaukJ/simple_ciphers"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/BaukJ/simple_ciphers"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
