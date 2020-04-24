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
end
