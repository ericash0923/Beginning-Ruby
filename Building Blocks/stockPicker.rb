def stock_picker(stock)
max, min, profit = 0,0,0
(1..stock.length-1).each do |sold|
  (0..sold).each do |bought|
    temp_max = stock[sold] - stock[bought]
    max, min , profit = sold, bought , temp_max if temp_max > profit
  end
  end
end
  puts "[#{min}, #{max}] made $#{profit}"
end

stock_picker ([17,15,6,9,3,8,6,1,10])
