class Artist

  attr_reader :name

  @@all =[]

  def initialize(name)
    @name = name 
    save
  end

  def name=(name)
    @name = name 
  end

  def self.all
    @@all 
  end

  def save
    self.class.all << self 
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def add_song(song)
    song.artist = self 
  end

  def self.find_by_name(name)
    self.all.find { |artist| artist.name == name }
  end

  def self.create_by_name(name)
    artist = self.new(name) 
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : artist = self.new(name)
  end

  def print_songs
    # list = Song.all.reduce([]) do |memo, song|
    #   if song.artist == self 
    #     memo << song.name
    #   end
    #   memo
    # end
    
    # return list.cycle(1) { |song| puts song }

    songs.each {|song| puts song.name}
  end


end