class Artist
  attr_accessor :name, :songs, :genre

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
      title = Artist.new(name)
      title.save
      title
    end

    def add_song(song)
      song.artist = self unless song.artist
      songs << song unless song.include?(song)

    end

    def genres
      @songs.map {|s| s.genre }.uniq
    end
end
