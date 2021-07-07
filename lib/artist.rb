class Artist 
    attr_accessor :name
    @@all=[]
    def initialize(name)
        @name=name 
       self.class.all << self 
       
    end
    def self.all 
        @@all
    end
    def add_song(song) 
            song.artist=self
        end
        def songs
            Song.all.select do |s|
                s.artist == self
            end
        end
        def self.find_or_create_by_name(name)
            self.find(name) ? self.find(name) : self.new(name)
           
        end
            def self.find(name)
                self.all.find do |artists|
                artists.name==name
                end
            end
        
        

        def print_songs
            songs.select do |song|
              puts  song.name
            end
        end
        


end