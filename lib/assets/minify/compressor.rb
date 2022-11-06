# frozen_string_literal: true
require 'mkmf'

module Assets::Minify
  class Compressor
    attr_accessor :config, :file_path

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
      when :postcss
        `npx postcss #{@file_path}`
      end
    end

    def js_compressor
      @config.assets.js_compressor
    end

    def css_compressor
      @config.assets.css_compressor
    end
  end
end
