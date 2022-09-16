#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

class Museum
  def initialize(name, city, state, description)
    @name = name
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
  # f.puts 'Museum.create(['
  data.each do |row|
    puts "#{row},"
  end
  # f.puts '])'
  f.close
end
# Fetch and parse HTML document
# first = Nokogiri::HTML(URI.open('https://www.museumsusa.org/museums/?k=1271407%2cCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454'))
links = '/museums/?k=1271409%2cCity%3aAlameda%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aDavis%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLancaster%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPalo+Alto%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSanta+Ana%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aAliso+Viejo%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aDowney%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLincoln%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aParadise%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSanta+Barbara%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aAlturas%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aDunsmuir%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLong+Beach%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPasadena%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSanta+Clara%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aAnaheim%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aEl+Cajon%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLos+Altos%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPenn+Valley%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSanta+Cruz%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aAntioch%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aEscondido%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLos+Angeles%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPine+Grove%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSanta+Maria%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aAptos%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aEureka%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLos+Olivos%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPittsburg%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSanta+Monica%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aArcata%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aFort+Bragg%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aMalibu%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aRancho+Cucamonga%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSanta+Rosa%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aBakersfield%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aFremont%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aMartinez%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aRandsburg%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSebastopol%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aBerkeley%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aFresno%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aMill+Valley%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aRedding%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSolvang%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aBolinas%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aFullerton%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aMonterey%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aRedlands%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aStanford%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aBrea%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aGlendale%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aMoraga%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aRichmond%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aStockton%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aBurlingame%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aGonzales%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aNapa%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aRiverside%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSylmar%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aBurney%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aGrass+Valley%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aNewhall%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aRohnert+Park%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aThousand+Oaks%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCalistoga%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aGualala%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aNewport+Beach%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSacramento%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aTiburon%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCampbell%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aHalf+Moon+Bay%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aNorth+Fork%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSalinas%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aTorrance%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCarmel%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aHanford%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aNorthridge%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Bernardino%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aTulare%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCarson%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aHayward%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aOakland%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Bruno%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aUkiah%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCastro+Valley%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aHollister%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aOcotillo%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Clemente%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aVallejo%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCeres%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aHollywood%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aOjai%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Diego%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aVentura%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aChatsworth%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aHuntington+Beach%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aOntario%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Francisco%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aWalnut+Creek%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCherry+Valley%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aIrvine%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aOxnard%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Jose%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aWeaverville%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aChico%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aKentfield%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPacific+Grove%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Marcos%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aWeed%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aChula+Vista%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLa+Jolla%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPalm+Desert%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Pedro%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aWoodside%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aClaremont%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aLaguna+Beach%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aPalm+Springs%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aSan+Rafael%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aYountville%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454
/museums/?k=1271409%2cCity%3aCupertino%3bCategoryID%3a200050%3bState%3aCA%3bDirectoryID%3a200454'.split
datas = Array.new()
links.each do |link|
# first.search('table#ctl08_ctl00_rptChildNodes_dlItems_1 a / @href').each do |link|
  puts 'https://www.museumsusa.org' + link
  page = Nokogiri::HTML(URI.open('https://www.museumsusa.org' + link))
  items = page.css('.itemGroup .basic')
  if items.size == 0
    puts "no item found, maybe error"
    break
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
    puts museum
  end
end

writeResult(datas)
