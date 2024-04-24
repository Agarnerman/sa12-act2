require 'httparty'

username = 'Agarnerman'
url = "https://api.github.com/users/#{username}/repos"
response = HTTParty.get(url)
if response.success?
  repos = JSON.parse(response.body)
  most_starred = repos.max_by { |repo| repo['stargazers_count'] }
  puts "Most Starred Repository:"
  puts "  Name: #{most_starred['name']}"
  puts "  Description: #{most_starred['description']}" if most_starred['description']
  puts "  Stars: #{most_starred['stargazers_count']}"
  puts "  URL: #{most_starred['html_url']}"
else
  puts "Error: Failed to fetch repositories. Status code: #{response.code}"
end
