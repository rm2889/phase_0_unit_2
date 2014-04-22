# U2.W4: Cipher Challenge


# I worked on this challenge [by myself].



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  # so this is separating the coded_message into an array by characters
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c", 
            "h" => "d",   # Ans: There might be a method that does this shift. Hashes are designed to do a very quick dictionary look up
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here? 
    # Ans: looping inside each array element - the array being our original encoded message
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true? 
    # Ans: if its true, means that a match has been found - a match between our hash key and the encoded message key
    cipher.each_key do |y| # What is #each_key doing here? Ans: looping though each dictionary key
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        # comparing the keys and the encoded characters in the message, one by one
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here? Ans: coz you just found a match!
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing? Ans: looking for spaces, these are the codes for whitespace, we could have just added these to our hash
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do? Ans: Our algorithm encoded numbers with the same numbers
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for? Ans: if there's not match, then there's no encoding
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. Ans: matching digits
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate... taking the digits in the string and dividing them by 100 (every number -> set of continuous digits is transformed into that number/100)
  end  
  return decoded_sentence # What is this returning?        Ans:this is the return string
end

# Your Refactored Solution
def north_korean_cipher(coded_message)
  input = coded_message.split("")
  value = ("a".."z").to_a
  key = value.rotate(4)
  cipher = Hash[key.zip(value)]
  cipher_space = Hash[["@", "#", "$", "%", "^", "&", "*"].zip(((" "*7).split("")))]
  cipher.merge!(cipher_space)
  cipher_number = Hash[(0..9).to_a.zip(0..9).to_a]
  cipher.merge!(cipher_number)
  decoded_sentence = []
  input.each { |encoded_character|
    if cipher[encoded_character]
      decoded_sentence << cipher[encoded_character]
    else
      decoded_sentence << encoded_character
    end
  }

  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/)
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
  return decoded_sentence
end

# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!")
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"


# Reflection
=begin
  code's a lot cleaner now, BUT the part with the replacing the digits has stayed the same. Not sure if that can be done. Also still adding the non alphabet values pseudo-manually (see line 84) - it'd be nice if I can figure out a better way of doing this...Learnt the zip function and the Hash constructor, which was fun! Also read a little bit about regular expressions which seems useful
=end
  
end