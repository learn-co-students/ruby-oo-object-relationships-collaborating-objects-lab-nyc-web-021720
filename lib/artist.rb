class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        Artist.all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        curartist = self.all.find {|artist| artist.name == name}
        curartist ? curartist : self.new(name)
    end

    def print_songs
        corrsongs = Song.all.select {|song| song.artist == self}
        corrsongs.each {|song| puts song.name}
    end


end
