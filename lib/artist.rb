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
      @songs << song
      song.artist = self
    end

    def songs
      @songs
    end
end
