# frozen_string_literal: true

require_relative "lib/almapi/version"

Gem::Specification.new do |spec|
  spec.name = "almapi"
  spec.version = Almapi::VERSION
  spec.authors = ["jszenb"]
  spec.email = ["jerome.chiavassa-szenberg@campus-condorcet.fr"]

  spec.summary = "Gestion des appels à l'API web Alma."
  spec.description = "Gestion des appels à l'API web Alma. A détailler ensuite."
  spec.homepage = "https://rubygems.org/gems/almapi."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  # Push will be done on Rubygems.org by default, which is fine.
  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jszenb/almapi"
  spec.metadata["changelog_uri"] = "https://github.com/jszenb/almapi/blob/0dcb77349b61bfc2239c51600685bd16b1e7ebc0/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files =
    Dir.chdir(__dir__) do
      `git ls-files -z`.split("\x0").reject do |f|
        (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
      end
    end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "yard"

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday-follow_redirects'
  spec.add_dependency 'zeitwerk', '~> 2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
