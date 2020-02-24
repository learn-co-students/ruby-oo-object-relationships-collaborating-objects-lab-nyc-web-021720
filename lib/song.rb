class Song

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        Song.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist, songname = filename.split(" - ")
        song = self.new(songname)
        song.artist_name = filename.split(" - ")[0]
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


end