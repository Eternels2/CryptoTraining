# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

user_1 = User.create!(email: "c.guidet@lesang.com", password: "123456", password_confirmation: "123456", amount: 10000)
user_2 = User.create!(email: "e.zarazir@lesang.com", password: "123456", password_confirmation: "123456", amount: 10000)
user_3 = User.create!(email: "l.barbosa@lesang.com", password: "123456", password_confirmation: "123456", amount: 10000)
user_4 = User.create!(email: "t.brianceau@lesang.com", password: "123456", password_confirmation: "123456", amount: 10000)

Crypto.create!(name: "Bitcoin", abbreviation: "BTC", coingecko_id: "bitcoin", price: "42,259.30", image_url: "https://cryptologos.cc/logos/bitcoin-btc-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/1.svg")
Crypto.create!(name: "Ethereum", abbreviation: "ETH", coingecko_id: "ethereum", price: "3,176.78", image_url: "https://cryptologos.cc/logos/ethereum-eth-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/1027.svg")
Crypto.create!(name: "Binance Coin", abbreviation: "BNB", coingecko_id: "binancecoin", price: "414.89", image_url: "https://cryptologos.cc/logos/bnb-bnb-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/1839.svg")
Crypto.create!(name: "Solana", abbreviation: "SOL", coingecko_id: "solana", price: "110.22", image_url: "https://cryptologos.cc/logos/solana-sol-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/5426.svg")
Crypto.create!(name: "Terra", abbreviation: "LUNA", coingecko_id: "terra-luna", price: "88.37", image_url: "https://cryptologos.cc/logos/terra-luna-luna-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/4172.svg")
Crypto.create!(name: "XRP", abbreviation: "XRP", coingecko_id: "ripple", price: "0.743627", image_url: "https://cryptologos.cc/logos/xrp-xrp-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/52.svg")
Crypto.create!(name: "Cardano", abbreviation: "ADA", coingecko_id: "cardano", price: "1.02", image_url: "https://cryptologos.cc/logos/cardano-ada-logo.svg?v=022",  chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/2010.svg")
Crypto.create!(name: "Avalanche", abbreviation: "AVAX", coingecko_id: "avalanche-2", price: "79.80", image_url: "https://cryptologos.cc/logos/avalanche-avax-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/5805.svg")
Crypto.create!(name: "Polkadot", abbreviation: "DOT", coingecko_id: "polkadot", price: "18.86", image_url: "https://cryptologos.cc/logos/polkadot-new-dot-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/6636.svg")
Crypto.create!(name: "Dogecoin", abbreviation: "DOGE", coingecko_id: "dogecoin", price: "0.145815", image_url: "https://cryptologos.cc/logos/dogecoin-doge-logo.svg?v=022", chart_url: "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/74.svg")
