class MusicImporter

attr_accessor :path, :files


  def initialize(path)
    @path = path
  end

  def files
@files = Dir.glob("#{@path}/*.mp3").collect {|f| f.gsub("#{@path}/", "")}
  end

  def import
    self.files
    @files.each {|filename| Song.create_from_filename(filename)}
  end
end
