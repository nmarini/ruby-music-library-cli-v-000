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

  def list_songs
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
      input = gets.strip
  
      if artist = Artist.find_by_name(input)
        artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
          puts "#{i}. #{s.name} - #{s.genre.name}"
        end
      end
    end

  def list_songs_by_genre
    i = 0
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre1 = Genre.find_by_name(genre_name)
    if genre1 != nil
      sort_by(Genre).map do |genre|
        if genre.name == genre1
        genre.songs.artist.map do |artist|
          i += 1
          puts "#{i}. #{artist.name} - #{artist}"
        end
      end
    else nil
    end

  end


end
