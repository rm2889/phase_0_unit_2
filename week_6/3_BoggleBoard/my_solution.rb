# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself].


# 2. Pseudocode
=begin

#create_word
input: *coords which are optional two dimensional arrays
output: a string
method:
coords.map{|coord| @grid[coord.first,coord.last]}.join("")

#get_row
input: row_number
output: array representing a row of a board
method:
@grid[row_number]

#get_column
input: column_number
output: array representing a column of the board
method:
@grid.map{|row| @grid[row][column_number]}
=end


# 3. Initial Solution
class BoggleBoard
	attr_accessor :grid

	def initialize(grid)
		@grid = grid
	end

	def create_word(*coords)
		coords.map{|coord| @grid[coord.first][coord.last]}.join("")
	end

	def get_row(row_number)
		@grid[row_number]
	end

	def get_col(column_number)
		@grid.map{|row| row[column_number]}
	end

	def get_coordinate(coord)
		@grid[coord.first][coord.last]
	end

	def num_rows
		@grid.length
	end

	def num_cols
		@grid[0].length
	end
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
 


# 4. Refactored Solution

# 1. DRIVER TESTS GO BELOW THIS LINE
puts boggle_board.create_word([1,2],[1,1],[2,1],[3,2])=="dock"
puts boggle_board.get_row(2)==["e", "c", "l", "r"]
puts boggle_board.get_col(1)==['r','o','c','a']
puts boggle_board.num_cols == 4
puts boggle_board.num_rows == 4


# One way to print all rows as words
boggle_board.grid.map{|row| puts row.join("")}

# Print all columns as words
for col in 0..boggle_board.num_cols-1
	puts boggle_board.get_col(col).join("")
end

=begin

OUTPUT:

brae
iodt
eclr
take
biet
roca
adlk
etre

=end


# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:


# 5. Reflection 