class MusicImporter

    attr_accessor :path

    def initialize(path)
         @path = path
    end

    def files 
        @files = Dir.entries(@path)
        # binding.pry
        @files.delete_if { |file| file == "." || file == ".."}
    end

    # def import
    #     self.files.each { |filename| Song.new_by_filename(filename) }



end