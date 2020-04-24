require 'pry'

class Artist
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

    def add_song(song)
      if song.artist == nil
        @songs << song
        song.artist = self
      end
    end

    def songs
      @songs
    end

    def songs
      Song.all.select do |song|
        song.artist == self
      end
    end
    
    def genres
      songs.map do |song|
        song.genre
      end
    end
end
