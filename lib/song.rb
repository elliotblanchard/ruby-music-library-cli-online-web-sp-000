require 'pry'

class Song
  attr_accessor :name

    @@all = []

    def initialize(name,artist,genre)
      @name = name
      #@artist = artist
      #@genre = genre
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
end
