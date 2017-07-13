# frozen_string_literal: true

require "csv"
require "mods"
require File.expand_path("../../errors/missing_data.rb", __FILE__)
require File.expand_path("../../errors/wrong_encoding.rb", __FILE__)
require File.expand_path("../../util.rb", __FILE__)

module Check
  # Checks that the files specified in metadata actually exist
  module DataSources
    DATA_ROOT = Pathname.new("/opt/ingest").freeze

    # @param [Array<String>] files
    # @return [Array<MetadataError>]
    def self.batch(files)
      unless Dir.exist? DATA_ROOT
        $stderr.puts "#{Util.warn("WARNING:")} "\
                     "#{DATA_ROOT} does not exist; "\
                     "skipping checks."
        return []
      end

      files.map do |file|
        paths_for(file).map do |path|
          next if DATA_ROOT.join(path).exist?

          MissingData.new(
            file: file,
            problem: "#{DATA_ROOT.join(path)} doesn't exist."
          )
        end
      end.flatten.compact.select { |e| e.is_a? MetadataError }
    end

    # @param [String] file
    # @return [Array<String>]
    def self.paths_for(file)
      case File.extname(file)
      when ".xml"
        Mods::Record.new.from_file(
          file
        ).xpath("//mods:extension/fileName").map(&:text)
      when ".csv"
        CSV.table(file).map { |row| row[:file] }
      end
    # most likely an encoding error
    rescue ArgumentError => e
      [WrongEncoding.new(file: file, problem: e.message)]
    end
  end
end
