require 'pry'

class Genre
  attr_accessor :name

    @@all = []

    def initialize(name)
      @name = name
      @@all << self
      @songs = []
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

    def songs
      @songs
    end

    def add_song(song)
      #binding.pry
      if (@songs.include? song) == false
        @songs << song
      end
    end

    def songs
      Song.all.select do |song|
        song.artist == self
      end
    end

    def artists
      unique_artists = []
      songs.each do |song|
        unique_artists << song.artist
      end
      unique_artists.uniq
    end
end
