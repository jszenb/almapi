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
  # spec.files =
  #   Dir.chdir(__dir__) do
  #     `git ls-files -z`.split("\x0").reject do |f|
  #       (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ lib/ .git .circleci appveyor])
  #   end
  # end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]
  # If you need to check in files that aren't .rb files, add them here
  spec.files = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  spec.require_path = 'lib'

  spec.add_development_dependency "rspec", '~> 3.4'
  spec.add_development_dependency "rubocop", '~> 1.63', '>= 1.63.2'
  spec.add_development_dependency "rubocop-performance", '~> 1.21'
  spec.add_development_dependency "yard", '~> 0.9.36'

  spec.add_dependency 'faraday', '~> 2.9'
  spec.add_dependency 'faraday-follow_redirects', '~> 0.3.0'
  spec.add_dependency 'zeitwerk', '~> 2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
