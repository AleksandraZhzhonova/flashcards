# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open('http://www.de-online.ru/news/top_200_samykh_ispolzuemykh_nemeckikh_slov/2013-06-22-150'))
page.css('ol li').each do |row|
  unless row.text.split(" - ")[1].nil?
    translated = row.text.split(" - ")[1]
    original = row.css('b').text
    Card.find_or_create_by(original_text: original, translated_text: translated)
  end
end
