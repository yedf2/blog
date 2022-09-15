#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

class Museum
  def initialize(name, city, state, desc):
    @name = name
    @city  = city
    @state = state
    @desc = desc
end

# Fetch and parse HTML document
first = Nokogiri::HTML(URI.open('https://www.museumsusa.org/museums/?k=1271407%2cCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454'))

first.search('table#ctl08_ctl00_rptChildNodes_dlItems_1 a / @href').each do |link|
  page = Nokogiri::HTML(URI.open('https://www.museumsusa.org' + link))
  page.search('', '').each do |museum|
    puts museum.content
  end
end
# # Search for nodes by css
# doc.css('nav ul.menu li a', 'article h2').each do |link|
#   puts link.content
# end

# # Search for nodes by xpath
# doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
#   puts link.content
# end

# # Or mix and match
# doc.search('nav ul.menu li a', '//article//h2').each do |link|
#   puts link.content
# end