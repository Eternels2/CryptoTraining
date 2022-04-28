module CryptoHelper
  # The fibonacci is trash if you do scalping (day trading) with 30 days crypto data
  # You take the coresponding data with the coresponding trading technique (long trading: 90 days/ 30 days, day trading: 1 day/ 3 days)
  def custom_fibonacci(coingecko_api_id, day)
    begin
      coingecko_data = RestClient.get("https://api.coingecko.com/api/v3/coins/#{coingecko_api_id}/ohlc?vs_currency=usd&days=#{day}")
    rescue => e
      return "Wait" # rescue exception but still exit program
    end
    data = coingecko_data.body.tr('[]', '').split(",").map{ |element| element.to_f if element.length < 13 }.compact
    max_price = data.max
    low_price = data.min
    price = Crypto.where(coingecko_id: coingecko_api_id)[0].price.to_f
    fibonacci_sell_zone = (max_price.to_f - ((max_price.to_f - low_price.to_f) * 0.236))
    fibonacci_wait_zone2 = (max_price.to_f - ((max_price.to_f - low_price.to_f) * 0.382))
    fibonacci_wait_zone = (max_price.to_f - ((max_price.to_f - low_price.to_f) * 0.500))
    fibonacci_buy_zone = (max_price.to_f - ((max_price.to_f - low_price.to_f) * 0.618))
    fibonacci_buy_zone2 = (max_price.to_f - ((max_price.to_f - low_price.to_f) * 0.786))
    # calculating fibonacci
    if price >= fibonacci_sell_zone # price above fibonacci sell zone
      'Sell'
    elsif fibonacci_sell_zone >= price && price >= fibonacci_wait_zone2 # price between sell zone and wait zone2
      'Wait'
    elsif fibonacci_wait_zone2 >= price && fibonacci_wait_zone <= price # price between wait zone 2 and wait zone
      'Wait'
    elsif fibonacci_wait_zone >= price && fibonacci_buy_zone2 <= price # price between wait zone and buy zone2
      'Wait'
    elsif fibonacci_buy_zone2 >= price && fibonacci_buy_zone <= price # price between buy zone 2 and buy zone
      'Buy'
    elsif fibonacci_buy_zone2 > price # price bellow buy zone
      'Buy'
    end
  end

  def get_price(coingecko_api_id)
    begin
      coingecko_price = RestClient.get("https://api.coingecko.com/api/v3/simple/price?ids=#{coingecko_api_id}&vs_currencies=usd")
    rescue => e
      return Crypto.where(coingecko_id: coingecko_api_id)[0].price.to_f
    end
    price = JSON.parse(coingecko_price.body)[coingecko_api_id]["usd"].to_f
    return price
  end

  def get_price_by_amount(coingecko_api_id, coin_amount)
    price = get_price(coingecko_api_id)
    return ((coin_amount * 100) * price / 100).round(2)
  end
end
