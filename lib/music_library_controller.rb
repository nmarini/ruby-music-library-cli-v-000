class MusicLibraryController
attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call

    puts "Welcome to your music library!"

    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    until gets.strip == "exit"
      loop
    end

  end

  def sort_by(something)
    something.all.sort{|x, y| x.name <=> y.name}
  end
  def list_songs
    i = 0
    sort_by(Song).map do |song|
      i += 1
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    i = 0
    sort_by(Artist).map do |artist|
      i += 1
      puts "#{i}. #{artist.name} - #{artist.songs.name} - #{songs.genre.name}"
    end

  end

end
