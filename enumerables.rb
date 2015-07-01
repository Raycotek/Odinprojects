module Enumerable

#3
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
	end

#4	
	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i += 1
		end
	end
	
#5
	def my_select
		select = []
		self.my_each {|elem| select << elem if yield(elem)}
		select
	end

#6
	def my_all?
		true
		self.my_each {|elem| return false if !yield(elem)}
	end

#7
	def my_any?
		self.my_each {|elem| return true if yield(elem)}
		false
	end
	
#8
	def my_none?
		self.my_each {|elem| return false if yield(elem)}
		true
	end
	
#9
	def my_count
		t=0
		self.my_each {|elem| t+=1 if yield(elem)}
		t
	end
	
#10
	def my_map
		output = []
		self.my_each {|elem| output << yield(elem)}
		return output
	end
	
#11
	def my_inject
		memo = self[0]
		for elem in self[1]..self[self.length-1]
			memo = yield(memo, elem)
		end
		return memo
	end
	
#12
	def multiply_els(array)
		array.my_inject {|product, num| product * num}
	end
	
#13 dnf

#14 dnf	
		
end



