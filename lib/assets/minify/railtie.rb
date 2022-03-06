# frozen_string_literal: true

module Assets::Minify
  module Rails
    class Railtie < ::Rails::Railtie
      config.assets.css_compressor = nil
      config.assets.js_compressor  = nil
      rake_tasks do
        load "tasks/assets/minify/compress.rake"
      end
    end
  end
end
