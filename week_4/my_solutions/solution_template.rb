# U2.W4: Title here


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: will be an array of strings
# Output: will be a list of group objects, each group object will contain an array of 4 or 5 unique groups
# Steps:
=begin

input_array is the array of unique numbers which have been alloted to every member
large_group = input_array % 4
create new array from 1..input_array/4 = num_groups
FOR i = 1 to num_groups
	initialize new group object
	set group.member = []
	add object to group_array (add to the end for convenience)
END FOR

FOREACH input_array x
	Set rand = random number between [1 and group_array.length]
	current_group = group_array[rand]
	current_group.member.add(x)
	IF large_group > 0
		IF current_group.length == 5
			large_group -= 1
			output_group.push(current_group)
			group_array.delete_at(rand)
		END
	ELSE (case where large_group = 0)
		IF current_group.length == 4
			large_group -= 1
			output_group.push(current_group)
			group_array.delete_at(rand)
		END
	END IF
END FOR

return output_group

NOW RUN THIS 3 TIMES TO GET THREE DIFFERENT output_groups



# *******************************SEE HERE ****************************
# oh man after reading the whole set of instructions, I realized there might be a built in function that does this, and viola, its 
# array.each_slice(4).to_a. JEEZ let's rewrite the pseudocode

input_array is the array of numbers
scrambled_array = input_array.shuffle
output_array = scrambled_array.each_slice(4).to_a


=end

# 3. Initial Solution




# 4. Refactored Solution








# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 





