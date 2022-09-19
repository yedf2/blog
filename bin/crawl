#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

class Museum
  def initialize(name, city, state, description)
    @name = name.gsub(/'/, '"')
    @city = city
    @state = state
    @description = description.gsub(/'/, '"')
  end
  def to_s()
    return "{'name':'#@name','city':'#@city','state':'#@state','description':'#@description'}"
  end
end


def writeResult(data)
  f = File.new('db/seeds.rb', 'w+')
  f.puts 'Museum.create(['
  data.each do |row|
    f.puts "#{row},"
  end
  f.puts '])'
  f.close
end
# Fetch and parse HTML document
first = Nokogiri::HTML(URI.open('https://www.museumsusa.org/museums/?k=1271407%2cCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454'))

datas = Array.new()
first.search('table#ctl08_ctl00_rptChildNodes_dlItems_1 a / @href').each do |link|
  puts 'https://www.museumsusa.org' + link
  page = Nokogiri::HTML(URI.open('https://www.museumsusa.org' + link))
  items = page.css('.itemGroup .basic')
  if items.size == 0
    puts "no item found, maybe error occured"
  end
  items.each do |museum|
    location = museum.css('.location')[0].content.split(',')
    name = museum.css('.party')[0].content.strip()
    abstract = museum.css('.abstract')
    description = ''
    if abstract.size() > 0
      description = abstract[0].content.strip()
    end
    museum = Museum.new(name, location[0].strip(), location[1].strip(), description)
    datas << museum
  end
end

writeResult(datas)
