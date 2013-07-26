require 'nokogiri'
require 'open-uri'

url = "http://www.jobscore.com/jobs/puppetlabs"

data = Nokogiri::HTML(open(url))

jobListings = data.css('.job-listing')

titleArray = jobListings.map do |listing|
  listing.at_css('td.job-title').text.strip.downcase
end

internArray = []

titleArray.each do |title|
  if title.include?('intern')
    internArray.push(title)
  end
end


puts internArray