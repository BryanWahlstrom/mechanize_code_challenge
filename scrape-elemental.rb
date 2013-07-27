require 'nokogiri'
require 'open-uri'

url = "http://elementaltechnologies.theresumator.com/apply/jobs/"

data = Nokogiri::HTML(open(url))

jobListings = data.css('a.job_title_link')

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