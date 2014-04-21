# U2.W4: Title here


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: will be an array of strings
# Output: will be a list of group objects, each group object will contain an array of 4 or 5 unique groups
# Steps:
=begin

person/place + "was an important " + "person/place" + " in " + date + "."

essay_writer(title,topic,date,thesis_statement,pronoun)
IF pronoun =="male"
	first_line = title + " was a very important person in " + date.to_s + ". "
	second_line = "He did a lot. "
	third_line = "I want to learn more about him. "
	fourth_line = "His contribution is important. "
	return topic + "/n" + "/n" + first_line + second_line + third_line + thesis_statement + fourth_line
ELSEIF pronoun = "female"
	first_line = title + " was a very important person in " + date.to_s + ". "
	second_line = "She did a lot. "
	third_line = "I want to learn more about her. "
	fourth_line = "Her contribution is important. "
	return topic + "/n" + "/n" + first_line + second_line + third_line + thesis_statement + fourth_line
ELSEIF pronoun = "thing"
	first_line = title + " was a very important place in " + date.to_s + ". "
	second_line = "There was a lot going on there. "
	third_line = "I want to learn more about it. "
	fourth_line = "It's contribution is important. "
	return topic + "/n" + "/n" + first_line + second_line + third_line + thesis_statement + fourth_line
END	IF
=end

# 3. Initial Solution

def essay_writer(title,topic,date,thesis_statement,pronoun)
	if pronoun =="male"
		first_line = topic + " was a very important person in " + date.to_s + ". "
		second_line = "He did a lot. "
		third_line = "I want to learn more about him. "
		fourth_line = "His contribution is important. "
		return topic + "\n\n" + first_line + second_line + third_line + thesis_statement + " " + fourth_line
	elsif pronoun == "female"
		first_line = topic + " was a very important person in " + date.to_s + ". "
		second_line = "She did a lot. "
		third_line = "I want to learn more about her. "
		fourth_line = "Her contribution is important. "
		return topic + "\n\n" + first_line + second_line + third_line + thesis_statement + " " + fourth_line
	elsif pronoun == "thing"
		first_line = topic + " was a very important place in " + date.to_s + ". "
		second_line = "There was a lot going on there. "
		third_line = "I want to learn more about it. "
		fourth_line = "It's contribution is important. "
		return topic + "\n\n" + first_line + second_line + third_line + thesis_statement + " " + fourth_line
	end
end

# 4. Refactored Solution



# 1. DRIVER TESTS GO BELOW THIS LINE

# if the output is a string
# if the output string contains the title, the topic, the date, the thesis_statement
# my_string.include? "cde"

puts essay_writer("The First Shogun", "Tokugawa Ieyasu", 1603, "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years.", "male") 


# 5. Reflection 
=begin

	
=end

