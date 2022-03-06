# frozen_string_literal: true

namespace :assets_minify do
  desc "Minify the files"
  task :compress, :environment do
    output_path = Assets::Minify::OutputPath.new(
      ::Rails.application.config.assets.output_path
    )

    output_path.files.each do | file_path |
      compressor = Assets::Minify::Compressor.new(file_path)
      case file_path.to_s
      when /\.js$/
        next unless compressor.js_compressor
        File.write(file_path, compressor.js_compress)
        Assets::Minify.logger.info "Minify #{file_path}"
      when /\.css$/
        next unless compressor.css_compressor
        File.write(file_path, compressor.css_compress)
        Assets::Minify.logger.info "Minify #{file_path}"
      end
    end
  end
end

if Rake::Task.task_defined?("assets:precompile")
  Rake::Task['assets:precompile'].enhance do
    Rake::Task['assets_minify:compress'].invoke
  end
end
