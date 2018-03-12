class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
      @name = name
      @songs = []
      @@all << self
    end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    title = Genre.new(name)
    title.save
    title
  end

  def artist
    songs.collect { |s| s.artist }.uniq
  end

  def add_song(song)
    if !self.songs.include?(song)
      @songs << song
    end
end
