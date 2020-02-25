class Artist
    attr_accessor :name 
    @@all=[]
    def initialize(name)
        @name = name 
        Artist.all<<self 
    end
    def self.all
        @@all
    end 

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select{|elem| elem.artist == self}
    end
    def self.find_or_create_by_name(name)
        if Artist.all.select{|elem| elem.name == name}.length==1 
            return Artist.all.select{|elem| elem.name == name}[0]
        else  
            self.new(name)
        end 
    end
    def print_songs 
       for elem in self.songs 
        puts elem.name 
       end 
    end 
end