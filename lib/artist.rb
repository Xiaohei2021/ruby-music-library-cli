require 'pry'
class Artist

    extend Concerns::Findable
    # extend Findable::ClassMethods
    extend Memorable::ClassMethods

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.create(name)
        artist = self.new(name)
        artist.name = name
        artist
    end

    def add_song(song)
        @songs << song 
        song.artist = self unless song.artist 
            # binding.pry
    end

    def songs
        Song.all.select { |song| song.artist == self}
    end

    # def self.find(name)
    #     self.all.detect {|artist| artist.name == name}
    # end

    # def self.find_or_create_by_name(name)
    #     self.find(name) || self.create(name) 
    #  end
     
    # def new_song(name, genre)
    #     Song.new(name, self, genre)
    # end

    def genres
        # binding.pry
        songs.map {|song| song.genre}.uniq
    end

   

   

end
