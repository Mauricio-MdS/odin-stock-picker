def stock_picker(stock_prices)
  profit = 0
  best_days = [nil, nil]
  stock_prices.each_with_index do |buying_price, buying_day|
    possible_selling_day = stock_prices.drop(buying_day + 1)
    return best_days if possible_selling_day.empty?

    selling_price = possible_selling_day.max
    selling_day = possible_selling_day.index(selling_price) + buying_day + 1
    if selling_price - buying_price > profit
      profit = selling_price - buying_price
      best_days[0] = buying_day
      best_days[1] = selling_day
    end
  end
end
