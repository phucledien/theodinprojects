def stock_picker(price_array)
    info_array = []
    profit_array = []
    bestday = []
    n = price_array.length
    for i in 0...n-1 do
        for j in i+1...n do
            if price_array[i] < price_array[j]
                profit = price_array[j] - price_array[i]
                profit_array.push profit
                new_info = { :buyday => i, :sellday => j, :profit => profit }
                info_array.push new_info 
            end
        end
    end
    max_profit = profit_array.max 
    info_array.each do |info|
        return [info[:buyday], info[:sellday]] if info[:profit].equal? max_profit
    end
end

# => [1, 4]
p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
