require 'nokogiri'
require 'open-uri'

url = "https://ch.tbe.taleo.net/CH06/ats/servlet/Rss?org=CVENT2&cws=40"

xml = Nokogiri::XML(open(url))

jobListings = xml.xpath("//item")


titleArray = jobListings.map do |listing|
  listing.xpath('title').text.strip.downcase
end

searchArray = []

titleArray.each do |title|
  if title.include?('search')
    searchArray.push(title)
  end
end

puts titleArray
puts searchArray
