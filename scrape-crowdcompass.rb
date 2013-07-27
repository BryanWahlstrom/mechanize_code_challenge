require 'nokogiri'
require 'open-uri'

url = "https://ch.tbe.taleo.net/CH06/ats/servlet/Rss?org=CVENT2&cws=40"

data = Nokogiri::HTML(open(url))

jobListings = data.css("item title")


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
