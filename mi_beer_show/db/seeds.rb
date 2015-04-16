# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include CloudStorage

result = CloudStorage.get_all_files
p result.data

result.data.items.each do |item|
	p item.name
	p item.mediaLink
	if item.contentType == "audio/mp3"
		Podcast.create!(title: item.name, resource_url: item.mediaLink)
	end
end

User.create!(username: "brandonmanson", password: "password")