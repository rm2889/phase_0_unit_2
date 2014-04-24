# U2.W6: Drawer Debugger


# I worked on this challenge [by myself].


# 2. Original Code

class Drawer

	attr_reader :contents

	# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = nil) #what is `#pop` doing? Ans: it is removing the last element of the array and returning it.
		# So if no arguments are passed, then it defaults to the last item in the array, otherwise it removes the item passed
		if @contents
			if item
				@contents.delete(item)
			else
				item = @contents.pop
			end
		else
			raise ArgumentError.new("Cannot remove item from an empty drawer!")
		end
		# puts item
		return item
	end

	def dump  # what should this method return?
		# Empty out the drawer?
		@contents = []
		@open = true
		puts "Your drawer is empty."
	end

	def view_contents
		puts "The drawer contains:"
		@contents.each {|silverware| puts "- " + silverware.type }
	end

	def is_empty?
		if @contents==[]
			return true
		else
			return false
		end
	end

end


class Silverware
attr_reader :type

# Are there any more methods needed in this class?

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

	def clean_silverware
		@clean = true
	end

	def clean
		@clean = true
	end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return? This time it should return 0 items?

fork = Silverware.new("fork")
silverware_drawer.add_item(fork)

eating_fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
eating_fork.eat

#BONUS SECTION
puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE
silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 

silverware_drawer.open
puts silverware_drawer.open == true
puts silverware_drawer.close == false
puts silverware_drawer.is_empty? == false
silverware_drawer.dump
puts silverware_drawer.is_empty? == true



# 5. Reflection 
# Some of the questions were open-ended and I'm sure my interpretation is gonna be way different from someone else's. Learned about attr_reader, attr_accessor, etc.