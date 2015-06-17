def substrings(inputs, dictionary)

	inputs=inputs.downcase
	matches = []

	for i in 0..dictionary.length-1
	
		j=0
		search_length = dictionary[i].length-1
		
		while j < inputs.length - search_length
			search_term = inputs[j..j + search_length]	
				if search_term == dictionary[i]
					matches << dictionary[i]
				end
			j+=1
		end	
						
	end

	frequencies = Hash.new(0)	
	matches.each { |match| frequencies[match] += 1 }
		
	p frequencies
	
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
