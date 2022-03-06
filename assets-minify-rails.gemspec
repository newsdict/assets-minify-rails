# frozen_string_literal: true

require_relative "lib/assets/minify/version"

Gem::Specification.new do |spec|
  spec.name = "assets-minify-rails"
  spec.version = Assets::Minify::VERSION
  spec.authors = ["yubele"]
  spec.email = ["yusuke@newsdict.jp"]

  spec.summary = "Minify assets files"
  spec.description = "Minify with yui-compressor, tester in propshaft."
  spec.homepage = "https://github.com/newsdict/asset-minify-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/newsdict/asset-minify-rails/releases"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "README.md"]

  spec.add_dependency "actionpack", ">= 7.0.0"
  spec.add_dependency "activesupport", ">= 7.0.0"
  spec.add_dependency "railties", ">= 7.0.0"
  spec.add_dependency "rack"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
