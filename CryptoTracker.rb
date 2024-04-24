require 'httparty'
require 'json'

url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
response = HTTParty.get(url)
if response.success?
  data = JSON.parse(response.body)
  sorted_data = data.sort_by { |crypto| crypto['market_cap'] }.reverse
  puts "Top 5 Cryptocurrencies by Market Capitalization (USD)"
  puts "-------------------------------------------------"
  sorted_data[0...5].each do |crypto|
    name = crypto['name']
    price = crypto['current_price']
    market_cap = crypto['market_cap']
    puts "  - #{name} (Price: $#{price.round(2)}, Market Cap: $#{market_cap.round(2)} Billion)"
  end
else
  puts "Error: Failed to fetch cryptocurrency data. Status code: #{response.code}"
end
