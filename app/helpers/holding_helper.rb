module HoldingHelper
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
