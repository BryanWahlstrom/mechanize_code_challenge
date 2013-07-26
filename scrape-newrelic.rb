require 'nokogiri'
require 'open-uri'

url = "http://newton.newtonsoftware.com/career/CareerHome.action?clientId=4028f88b20d6768d0120f7ae45e50365"

data = Nokogiri::HTML(open(url))

jobListings = data.css('.gnewtonCareerGroupRowClass')

titleArray = jobListings.map do |listing|
  listing.at_css('.gnewtonCareerGroupJobTitleClass').text.strip.downcase
end

searchArray = []

titleArray.each do |title|
  if title.include?('search')
    searchArray.push(title)
  end
end

puts titleArray
puts searchArray