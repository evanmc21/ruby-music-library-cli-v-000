module Concerns::Findable

  def self.find_by_name(song_name)
    all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(name)
    create(name) || find_by_name(song_name)
  end


end
