require 'httparty'
require 'json'

timezone = 'Europe/London'
url = "http://worldtimeapi.org/api/timezone/#{timezone.split('/')[0]}/#{timezone.split('/')[1]}"
response = HTTParty.get(url)
if response.success?
  data = JSON.parse(response.body)
  current_datetime = data['datetime']
  date = current_datetime.split('T')[0]
  time = current_datetime.split('T')[1]
  puts "The current time in #{timezone} is #{date} #{time}"
else
  puts "Error: Failed to fetch time data for #{timezone}. Status code: #{response.code}"
end
