# frozen_string_literal: true

module Assets::Minify
  class OutputPath
    def initialize(path)
      @path = path
    end

    def files(child = nil)
      (child || @path).children.flat_map { |child| child.directory? ? files(child) : child }
    end
  end
end
