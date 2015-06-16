def stock_picker(prices)

max_profit = 0
buy_sell = []

	for i in 0..prices.length-2 do
		j = i+1
		while j < prices.length-1
			profit = prices[j] - prices[i]
			if profit > max_profit
				max_profit = profit
				buy_sell = []
				buy_sell << i
				buy_sell << j
			end
			j+=1
		end
	end
	
	p buy_sell

end

stock_picker([17,3,6,9,15,8,6,1,10])
