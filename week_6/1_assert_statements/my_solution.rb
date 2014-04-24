# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself, with: ].


# 2. Review the simple assert statement

# def assert
#   raise "Assertion failed!" unless yield
# end

# name = "bettysue"
# assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# First, the new variable name is declared. Then, the first assert block runs, and which evaluates to true, in which case there is
# output. Finally, the second assert block evaluates to false, and in the corresponding function yield evalates to false, raising
# the "Assertion failed error"


# 3. Copy your selected challenge here

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
	def initialize(number)
		digit_array = number.to_s.split("")
		if digit_array.count != 16
			raise ArgumentError.new("Needs to be exactly 16 digits")
		else
			@card_number = number
		end
	end

	def check_card
		counter = 0
		digit_array = @card_number.to_s.split("").map{ |digit| digit.to_i }
		while counter < 16
			if counter%2==0
				digit_array[counter]*=2
			end
		counter+=1
		end
		encoded_string = digit_array.map{|digit| digit.to_s}.join("")
		# now separate the string by digits again
		reencoded_digit_array = encoded_string.split("").map{ |digit| digit.to_i }
		total = reencoded_digit_array.inject { |sum, n| sum + n }
		if total%10 == 0
			return true
		else
			return false
		end
	end
end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

# card = CreditCard.new(4408041234567893)
# puts card.check_card == true

# card = CreditCard.new(4408041234567892)
# puts card.check_card == false

# puts CreditCard.instance_method(:initialize).arity == 1




# 4. Convert your driver test code from that challenge into Assert Statements
def assert
	raise "Assertion failed!" unless yield
end

assert {
	card = CreditCard.new(4408041234567893)
	card.check_card==true
}

# This should fail
assert {
	card = CreditCard.new(4408041234567894)
	card.check_card==true
}

assert {
	CreditCard.instance_method(:initialize).arity == 1
}

# 5. Reflection
# Learnt assert statements, as well as blocks. I guess these are better than the false/true tests as they tell you the exact line number
# where they failed == time saved!