class Genre

    extend Concerns::Findable
    extend Memorable::ClassMethods

    @@all = []

    attr_accessor :name

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
        genre = self.new(name)
        genre.name = name
        genre 
    end

    def songs
        Song.all.select { |song| song.genre == self}
    end
    
    def artists
        songs.map {|song| song.artist}.uniq
    end
end
