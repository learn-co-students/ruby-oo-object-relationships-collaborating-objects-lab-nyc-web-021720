class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name 
    save
  end

  def save 
    self.class.all << self 
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    artist = file.split(/ - |.mp3/)[0]
    name = file.split(/ - |.mp3/)[1]
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

end
