def caesar_cipher(input, n)
	
	char_nums = [] 
	cipher_nums = [] 

	chars = input.downcase.split("")
	chars.each {|char| char_nums << char.ord} 
	char_nums.each do |char_num| 
		if char_num > 96 
		char_num += n
		end	
		if char_num > 122
		char_num -= 26
		end
		cipher_nums << char_num.chr
	end
	 
	puts cipher_nums.join.capitalize!
	
end

puts caesar_cipher("What a string!", 5)
