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
IF output_array[last].length == 1
	output_array[first].push(output_array[last][0])
	output_array
ELSE IF output_array[last].length == 2
	output_array[first].push(output_array[last][0])
	output_array[second].push(output_array[last][1])
	output_array.pop
END IF

=end

# 3. Initial Solution

def create_accountability_group(input_array)
	scrambled_array = input_array.shuffle
	output_array = scrambled_array.each_slice(4).to_a
	if output_array.last.length == 1
	output_array[0].push(output_array.last[0])
	output_array.pop
	elsif output_array.last.length == 2
	output_array[0].push(output_array.last[0])
	output_array[1].push(output_array.last[1])
	output_array.pop
	elsif output_array.last.length == 3
	output_array[0].push(output_array.last[0])
	output_array[1].push(output_array.last[1])
	output_array[2].push(output_array.last[2])
	output_array.pop
	end
	return output_array
end

# 4. Refactored Solution
=begin
Pretty simple solution really. A couple of assumptions include that there must be atleast 8 people if the remainder by 4 is 2,
and atleast 5 people of the remainder by 4 is 1, and atleast 12 people if the remainder by 4 is 3. So, it won't work for the case
of 1,2,3,6,7,11 people in the cohort - so assume that atleast 12 people belong in the cohort

=end

# 1. DRIVER TESTS GO BELOW THIS LINE

# TEST 1
array_1 = Array (1..96)
output = create_accountability_group(array_1)

# check to see if the number of elements = 24
puts output.count == 24

# if every element is of length 4
a = true
output.each { |x|
	a = a && (x.count==4)
  }

puts(a)

# if every element in the subarray is an element of the main array
a = true
output.each {|item|
	item.each {|subitem|
		a = a && array_1.include?(subitem)
		}
}

puts (a)

array_2 = Array (1..97)	
output = create_accountability_group(array_2)

# check to see if the number of elements = 24
puts output.count == 24

# if exactly one subarray is of length 5
count_5 = 0
count_4 = 0
output.each {|item|
	if (item.count==5)
		count_5+=1
	elsif (item.count == 4)
		count_4+=1
	end
}

puts count_5 == 1
puts count_4 == 23

# if every element in the subarray is an element of the main array
a = true
output.each {|item|
	item.each {|subitem|
		a = a && array_1.include?(subitem)
		}
}

array_3 = Array (1..98)	
output = create_accountability_group(array_3)

# check to see if the number of elements = 24
puts output.count == 24

# if exactly two subarrays are of length 5
count_5 = 0
count_4 = 0
output.each {|item|
	if (item.count==5)
		count_5+=1
	elsif (item.count == 4)
		count_4+=1
	end
}
puts count_5 == 2
puts count_4 == 22

# if every element in the subarray is an element of the main array
a = true
output.each {|item|
	item.each {|subitem|
		a = a && array_1.include?(subitem)
		}
}

# if every element in the subarray is an element of the main array

array_4 = Array (1..99)	
output = create_accountability_group(array_4)

# check to see if the number of elements = 24
puts output.count == 24

# if exactly three subarrays are of length 5
count_5 = 0
count_4 = 0
output.each {|item|
	if (item.count==5)
		count_5+=1
	elsif (item.count == 4)
		count_4+=1
	end
}
puts count_5 == 3
puts count_4 == 21

# if every element in the subarray is an element of the main array
a = true
output.each {|item|
	item.each {|subitem|
		a = a && array_1.include?(subitem)
		}
}

# 5. Reflection 

