require 'pry'

class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        artist = file.split(" - ")[0]
        track = file.split(" - ")[1]
        song = Song.new(track)
        song.artist_name = artist
        song
        #binding.pry
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        # binding.pry
    end

end