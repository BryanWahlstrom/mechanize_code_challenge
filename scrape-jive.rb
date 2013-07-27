require 'nokogiri'
require 'open-uri'

url = "http://hire.jobvite.com/CompanyJobs/Careers.aspx?c=qLY9Vfwx&jvresize=/wp-content/themes/jive_1/frameresize.html"

data = Nokogiri::HTML(open(url))

jobListings = data.css('.evens .jvjoblink')

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