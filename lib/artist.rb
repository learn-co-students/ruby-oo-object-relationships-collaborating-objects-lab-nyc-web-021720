class Artist
    attr_accessor :name, :artist

    @@all = []

    def initialize(artist_name)
        @name = artist_name
        Artist.all << self
    end

    def self.find_or_create_by_name(artist_name)
        found_artist = Artist.all.find {|artist| artist.name == artist_name}
        if found_artist then
            found_artist
        else
            self.new(artist_name)
        end
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def print_songs
        puts songs.map {|song| song.name}
    end

    def self.all
        @@all
    end
end