# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself, with: ].


# Original Solution

# 3. Initial Solution

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


# Refactored Solution

class CreditCard
	def initialize(number)
		# one less step here as no need to create an array at this step
		number_of_digits = number.to_s.size
		if number_of_digits != 16
			raise ArgumentError.new("Needs to be exactly 16 digits")
		else
			@card_number = number
		end
	end

	def check_card
		
		digit_array = @card_number.to_s.split("").map{ |digit| digit.to_i }
		# can probably get rid of this loop here
		# counter = 0
		# while counter < 16
		# 	if counter%2==0
		# 		digit_array[counter]*=2
		# 	end
		# counter+=1
		# end
		
		# The loop was probably more readable, but oh well
		new_digit_array = (0..digit_array.length-1).map{ |index| index%2 == 0 ? digit_array[index]*2 : digit_array[index] }

		encoded_string = new_digit_array.map{|digit| digit.to_s}.join("")
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


# DRIVER TESTS GO BELOW THIS LINE

def assert
	raise "Assertion failed" unless yield
end

assert {
	card = CreditCard.new(4408041234567893)
	puts card.check_card == true
}

assert {
	card = CreditCard.new(4408041234567892)
	puts card.check_card == false
}

assert {
	CreditCard.instance_method(:initialize).arity == 1
}

# Reflection 
# learnt ternary operator in ruby within the map function - I think it made the code a little less readable, but hey atleast I learned 
# something new!