# U2.W4: Title here


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: will be an integer
# Output: will be a formatted string
# Steps:
=begin
input_string = input_integer.to_s
remaining_string = input_string
output_string = ""
i = 0
WHILE remaining_string.length>3
	temporary_string = remaining_string[-3,3]
	output_string = "," + temporary_string + output_string
	remaining_string = remaining_string[0,temporary_string.length-remaining_string.length]
END WHILE
output_string = remaining_string + output_string
return output_string

=end

# 3. Initial Solution

def separate_comma (input_integer)
	input_string = input_integer.to_s
	if input_integer < 0
		input_string = input_string.to_s[1,input_string.length]
	end

	remaining_string = input_string
	output_string = ""
	while remaining_string.length > 3
		temporary_string = remaining_string[-3,3]
		output_string = "," + temporary_string + output_string
		remaining_string = remaining_string[0,remaining_string.length-temporary_string.length]
	end
	output_string = remaining_string + output_string
	if input_integer < 0
		output_string = "-" + output_string
	end
	return output_string
end

# 4. Refactored Solution

# I think this is a good solution

# 5. Reflection

# Learned some string manipulation in this case by using indices. Also added a few lines so 
# that this works for negative values as well