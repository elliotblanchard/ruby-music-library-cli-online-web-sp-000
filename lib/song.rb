require 'pry'

class Song
  attr_accessor :name

    @@all = []

    def initialize(name,artist=nil)
      @name = name
      #self.artist=(artist)
      @artist = artist
      @@all << self
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

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end
end
