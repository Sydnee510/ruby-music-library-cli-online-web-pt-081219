class Artist 
 
 extend Concerns::Findable
 
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
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
  def self.create(new_artist)
    artist = self.new(new_artist)
    artist.save
    artist
  end 
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end 
  def songs 
    @songs
  end 
  def genres 
    songs.collect{|song| song.genre}.uniq
  end 
end 