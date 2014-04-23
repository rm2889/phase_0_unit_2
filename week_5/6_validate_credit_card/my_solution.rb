# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input:
# Output:
# Steps:

=begin
variables: @card_number

check_card
digit_array = @card_number.to_s.split("").map{ |digit|.to_i }
IF digit_array.count != 16
	RAISE ERROR
ELSE
	counter = 0
	WHILE counter < 16
		IF counter%2==0
			digit_array[counter]*=2
		END IF
		counter+=1
	END WHILE
	total = digit_array.inject { |sum, n| sum + n }
	IF total%10 == 0
		return true
	ELSE
		return false
	END IF
END IF



=end

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

card = CreditCard.new(4408041234567893)
puts card.check_card == true

card = CreditCard.new(4408041234567892)
puts card.check_card == false

puts CreditCard.instance_method(:initialize).arity == 1

# 5. Reflection 

# Learned to use map and inject. Also the process of converting an integer to a string, then to an array to get the digits multiple times doesn't look like the most efficient soliution
# Maybes there's a better way to do this...

