class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, new_artist = nil, new_genre = nil)
      @name = name
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless
    genre.songs.include?(self)
  end

  def self.find_by_name(song_name)
    all.detect {|song| song.name == song_name}
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.find_or_create_by_name(name)
    create(name) || find_by_name(song_name)
  end

  def self.new_from_filename(filename)
    section = filename.split(" - ")
    artist_name, song_name, genre_name = section[0], section[1], section[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end
end
