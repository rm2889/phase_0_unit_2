# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input:
# Output:
# Steps:
=begin

1. initialize:
Input: array of labels
Output: no output
Steps: 
IF sides.is_a?(Array)
	IF sides==[]
		raise argumentException
	ELSE
		@sides = sides
	END IF
ELSE
	raise argumentExeption -> need an array as an input
END IF

2. sides
just returning the sides

3. roll
just return sides.sample :)
=end

# 3. Initial Solution

class Die
  def initialize(labels)
  	if labels.is_a?(Array)
  		if labels == []
  			raise ArgumentError.new("Need more than an empty array homie G")
		else
			@sides = labels.count
			@labels = labels
		end
	else
		raise ArgumentError.new("Need an array as an input playa")
	end
  end

  def sides
  	@sides
  end

  def roll
  	@labels.sample
  end
end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

# Check if die.sides == number of labels
labels = ('A'..'Z').to_a
sides = labels.count
die = Die.new(labels)
puts die.sides == labels.count

# Check the possible range of the dice
possible_range = ('A'..'Z').to_a
unique_rolls = Array.new(5000) {die.roll}.uniq.sort
puts unique_rolls == possible_range

# Check if the initializer takes exactly one argument
puts Die.instance_method(:initialize).arity == 1

#check if that argument is an array
# puts Die.instance_method(:initialize).type == Array
# HOW DO WE DO THIS? I.E. CHECK IF THE PARAMETER OF AN INSTANCE METHOD IS AN ARRAY?

# 5. Reflection 

=begin
Nice to get some more practice with classes. New information learnt this time is the sample method for an array which returns a random element from the array
Need to figure out how to get the parameter type (Array in this case) of an instance method
=end