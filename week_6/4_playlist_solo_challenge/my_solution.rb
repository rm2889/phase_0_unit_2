# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge [by myself, with: ].


# Pseudocode
=begin
Classes:

CLASS: Song
Instance variables
- @song_name (string), @artist_name (string)

Methods:

- Initialize
	- Input: song_name, artist_name
	- Output: nil
	- assign @song_name, @artist_name

- play
	- input: none
	- output: none
	- displays "Currently playing " + @song_name + " by " + @artist_name

CLASS: Playlist
Instance variables:
- @playlist (array of Song objects)

Methods: 

- Initialize(*args)
	- input: song(s)
	- output: nil
	- create a new playlist object -> @playlist.push(args)

- add (*args)
	- input: song(s)
	- output: nil
	- add to the @playlist instance -> @playlist.push(args)

- num_of_tracks
	- returns @playlist.count

- play_all
	- pick any random song from the array and call song.play on it.

	The complete solution would be to select one
	song as currently playing, once that's done playing, set its status to false, and randomly select another one
	and set the new one's status to true but would need a timer, running time for each song, etc.!

- remove (song)
	- input: song
	- output: song
	- @playlist.delete(@song)

- includes?(song)
	- input: song
	- output: true if song is in the playlist, false otherwise

- display
	- outputs a list of songs in the playlist

=end


# Initial Solution
	
class Song
	attr_accessor :song_name
	attr_accessor :artist_name

	def initialize(song_name, artist_name)
		@song_name = song_name
		@artist_name = artist_name
	end

	def play
		puts "Currently playing " + @song_name + " by " + @artist_name
	end
end

class Playlist
	def initialize(*songs)
		@playlist = songs
	end

	def add(*songs)
		songs.each {|song| @playlist.push(song)}
	end

	def num_of_tracks
		@playlist.count
	end

	def remove(song)
		@playlist.delete(song)
		puts "Just deleted " + song.song_name + " by " + song.artist_name
	end

	def includes?(song)
		@playlist.include?(song)
	end

	def play_all
		song = @playlist.sample
		song.play
	end

	def display
		@playlist.each {|song| puts "Playlist includes " + song.song_name + " by " + song.artist_name}
	end

end

# Refactored Solution



# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display



# Reflection 
# This was a fun exercise - going through all the classes and determining which classes and methods are required. I think I did a good job.