def bubble_sort(array)
	complete = false
	until complete
		complete = true
		for i in 0...array.length-1
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				complete = false
			end
		end
	end
	p array
end


bubble_sort([4,3,78,2,0,2])


def bubble_sort_by words
  
  complete = false

  until complete
    complete = true
    for i in 0...words.length-1
      if yield(words[i], words[i+1]) < 0
        words[i], words[i+1] = words[i+1], words[i] 
        complete = false
      end
    end
  end
  p words
end

bubble_sort_by(["hi","hello","hey"]) do |left,right| 
	right.length - left.length 
end