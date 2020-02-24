require "pry"

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(song_name)
        @name = song_name
        Song.all << self
    end

    def artist_name=(artist_name)        
        found_artist = Artist.find_or_create_by_name(artist_name)
        #binding.pry
        @artist = found_artist
    end

    def self.new_by_filename(filename)
        artist_name, name = filename.split("-").map{|v| v.strip}
        new_song = Song.new(name)
        # binding.pry
        new_song.artist_name = artist_name
        new_song
    end

    def self.all
        @@all
    end
end