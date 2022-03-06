# frozen_string_literal: true

module Assets::Minify
  class Compressor
    def initialize(file_path)
      @config = ::Rails.application.config
      @file_path = file_path
    end

    def js_compress
      case js_compressor
      when :yui, :yui_compressor
        ::YUI::JavaScriptCompressor.new.compress(File.read(@file_path))
      when :terser
        ::Terser.compile(File.read(@file_path))
      end
    end

    def css_compress
      case css_compressor
      when :yui, :yui_compressor
        ::YUI::CssCompressor.new.compress(File.read(@file_path))
      end
    end

    def js_compressor
      @config.js_compressor
    end

    def css_compressor
      @config.css_compressor
    end
  end
end
