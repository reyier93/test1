require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

#Request the page we're going to scrape
page = HTTParty.get('https://newyork.craigslist.org/search/pet?s=0', verify: false)

#Converting HTML string into a Nokogiri object
parse_page = Nokogiri::HTML(page)

#An array where we will store all the pets from craigslist
pets_array = []

#Parsing the data
parse_page.css('.content').css('.row').css('.hdrlnk').map do |a|
    post_name = a.text
    pets_array.push(post_name)
end

Pry.start(binding)