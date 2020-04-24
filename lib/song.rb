require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name

    @@all = []

    def initialize(name,artist=nil,genre=nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
      @@all << self
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def artist
      @artist
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end

    def genre
      @genre
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

    def self.create(name)
      self.new(name)
    end

    def artist_name=(artist_name)
      @artist_name = Artist.find_or_create_by_name(artist_name)
      @artist = @artist_name
    end

    def artist_name
      @artist_name
    end

    def genre_name=(genre_name)
      @genre_name = Genre.find_or_create_by_name(genre_name)
      @genre = @genre_name
    end

    def genre_name
      @genre_name
    end

    def self.new_from_filename(filename)
      parsed_filename = filename.split(" - ")
      new_song = self.new(parsed_filename[1])
      new_song.artist_name = parsed_filename[0]
      new_song.genre_name = parsed_filename[2]
      new_song.artist.add_song(new_song)
      new_song.genre.add_song(new_song)
      new_song
    end

    def self.create_from_filename(filename)
      @@all << self.new_from_filename(filename)
    end
end
