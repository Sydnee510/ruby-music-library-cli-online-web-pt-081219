class Genre 
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
  def self.create(new_genre)
    genre = self.new(new_genre)
    genre.save
    genre
  end
  def songs 
    @songs 
  end
  def artists
    songs.collect{|song| song.artist}.uniq
  end
end

