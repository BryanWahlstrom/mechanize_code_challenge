require 'nokogiri'
require 'open-uri'

url = "http://www.jobscore.com/jobs/puppetlabs"

data = Nokogiri::HTML(open(url))

jobListings = data.css('.job-listing .job-title')

titleArray = jobListings.map do |listing|
  listing.text.strip.downcase
end

searchArray = []

titleArray.each do |title|
  if title.include?('search')
    searchArray.push(title)
  end
end

puts titleArray
puts searchArray