require 'pry'

class Song
  attr_accessor :name, :artist

    @@all = []

    def initialize(name,artist)
      @name = name
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

    def artist
      @artist
    end

    def artist=(artist)
      @artist = artist
    end
end
