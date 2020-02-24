# require_relative '.spec/fixtures/mp3s.rb'

class MP3Importer

  attr_reader :path 

  def initialize(path)
    @path = path 
  end

  def files
    # global substitute 
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import 
    files.each{|f| Song.new_by_filename(f)}
  end
end

# MP3Importer
#   #initialize
#     accepts a file path to parse mp3 files from
#   #files
#     loads all the mp3 files in the path directory (FAILED - 1)
#     normalizes the filename to just the mp3 filename with no path (FAILED - 2)
#   #import
#     imports the files into the library by creating songs from a filename (FAILED - 3)