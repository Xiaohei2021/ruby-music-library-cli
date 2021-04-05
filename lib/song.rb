class Song

    extend Concerns::Findable
    # extend Findable::ClassMethods
    extend Memorable::ClassMethods

    @@all = []

    attr_accessor :name
    attr_reader :artist, :genre
    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist if artist
        self.genre = genre if genre
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create(name)
        song = self.new(name)
        song.name = name
        song
    end

    def artist=(artist)
        #   binding.pry
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name) 
    end

    def self.new_from_filename(file)
      
        song_title = file.split(" - ")[1]
        song_artist = file.split(" - ")[0]
        song = self.new(song_title)
        song.artist_name = song_artist
        song
        binding.pry
    end

    # def genre
    #     Genre.all.select {|genre| genre.song == self}
    # end

 

end
