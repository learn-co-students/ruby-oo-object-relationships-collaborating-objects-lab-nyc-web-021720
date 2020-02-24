require "pry"

class MP3Importer

    attr_reader :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        all_files = Dir.entries(@path)
        mp3_files = all_files.select{|file| file.include?(".mp3")}
        # binding.pry
    end

    def import
        files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end
end