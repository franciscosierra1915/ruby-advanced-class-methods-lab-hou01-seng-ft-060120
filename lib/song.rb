class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @song = song
    @@all << @song
    @song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song 
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical 
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(artist_song_format)
    song = self.new
    song.name = (artist_song_format.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (artist_song_format.split(" - ")[0])
    song
  end
  def self.create_from_filename(artist_song_format)
    song = self.new
    song.name = (artist_song_format.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (artist_song_format.split(" - ")[0])
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
