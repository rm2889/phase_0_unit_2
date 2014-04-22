# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input:
# Output:
# Steps:
=begin
initialize method -> 


=end


# 3. Initial Solution

class Die
  def initialize(sides)
    # code goes here
    if sides < 1
    	raise ArgumentError.new("Number of sides should be greater than one homie")
    else
    	@sides = sides
    end
  end
  
  def sides
    # code goes here
    @sides
  end
  
  def roll
    # code goes here
    1+rand(@sides)
  end
end



# 4. Refactored Solution

=begin

Very little code, don't think there needs to be any refactoring
	
=end	

# 1. DRIVER TESTS GO BELOW THIS LINE

# Check if die.sides == sides
sides = 5
die = Die.new(sides)
puts die.sides == sides

# Check the possible range of the dice
possible_range = (1..5).to_a
unique_rolls = Array.new(5000) {die.roll}.uniq.sort
puts unique_rolls == possible_range

# Check if the initializer takes exactly one argument
puts Die.instance_method(:initialize).arity == 1

# 5. Reflection  
=begin 

Learnt how to write a simple class and instance methods. Learnt the rand method, and also how to
raise exceptions. Also getting a better handle on reading rspec

=end
