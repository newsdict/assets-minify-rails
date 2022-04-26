# frozen_string_literal: true

module Assets::Minify
  class Logger < StandardError
    attr_accessor :file_path, :before_size, :after_size, :total_before_size, :total_after_size
    mattr_accessor :logger, default: ::Logger.new(STDOUT)

    def initialize
      @total_after_size = 0
      @total_before_size = 0
    end

    def start(file_path)
      @file_path = file_path
      @before_size = File.size(file_path)
      @total_before_size += @before_size
    end

    def minified
      @after_size = File.size(@file_path)
      @total_after_size += @after_size
      logger.info "Minify #{@file_path} #{@before_size} to #{@after_size} (#{@after_size > 0 ? 100 - @before_size / @after_size : '-'}%)"
    end

    def finished
      logger.info "Total minify ratio #{@total_before_size} to #{@total_after_size} (#{@total_after_size > 0 ? 100 - (@total_before_size.to_f / @total_after_size).round(2) : '-'}%)"
    end
  end
end
