# frozen_string_literal: true

require_relative "assets/minify/version"
require_relative "assets/minify/errors"
require_relative "assets/minify/compressor"
require_relative "assets/minify/output_path"
require_relative "assets/minify/railtie"

module Assets::Minify
  mattr_accessor :logger, default: Logger.new(STDOUT)
end
