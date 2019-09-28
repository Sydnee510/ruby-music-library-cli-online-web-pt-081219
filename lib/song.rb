class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
  end 
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
   def genre= (genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  def self.all 
    @@all 
  end 
  def self.destroy_all 
    @@all = []
  end 
  def save 
    @@all << self 
  end 
  def self.create(new_song) 
    song = Song.new(new_song) 
    song.save 
    song
  end 
   def artist 
     @artist 
   end 
  def genre 
    @genre 
  end
  def self.find_by_name(name) 
     @@all.detect{|song| song.name == name}
  end 
  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
  # if self.find_by_name(name)
  #     self.find_by_name(name)
  #   else
  #     song = self.create(name)
  #   end
end
end