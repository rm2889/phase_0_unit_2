# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself].

# 2. Pseudocode

=begin

@@solved = false

1. initialize
# Input: an integer which is the answer
# Output: nothing
# Steps:
initialize with an integer, throw an exception if its not an integer (integer class is Fixnum)
@answer = answer

2. guess(guessed_number)
input: An integer
output: returns a symbol
IF guessed_number>@answer
	return :high
ELSE IF guessed_number<@answer
	return :low
ELSE return :correct
END IF

3. solved?
output: boolean value of class variable @@solved

=end


# 3. Initial Solution

class GuessingGame
  def initialize(answer)
  	if answer.is_a?(Fixnum)
  		@answer = answer
  		@solved = false
	else
		raise ArgumentError.new("Need an integer as the input constructor yo!")
	end
  end
  
  # Make sure you define the other required methods, too
  def guess(guessed_number)
  	if guessed_number > @answer
  		@solved = false
  		return :high
  	elsif guessed_number < @answer
  		@solved = false
  		return :low
	else
		@solved = true
		return :correct
	end
  end

  def solved?
  	return @solved
  end
end


# 4. Refactored Solution


# 1. DRIVER TESTS GO BELOW THIS LINE
game = GuessingGame.new(10)
puts game.guess(50) == :high
puts game.guess(0)== :low
puts game.solved? == false
puts game.guess(10) == :correct
puts game.solved? == true



# 5. Reflection 
# Made the mistake of thinking that @solved is a class method, but it should be an instance method. Also need to make a better pseudocode blueprint when defining classes
# Finally, need to learn the difference between 