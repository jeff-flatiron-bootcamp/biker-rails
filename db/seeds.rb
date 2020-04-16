# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rubygems'
require 'json'
require 'faker'

manufacturer_seed_file_path = './db/bike-manufacturers.json'
#biker_seed_file_path = './db/bikers.txt'
bike_seed_file_path = './db/bikes.txt'

#Empty DB
Biker.all.destroy_all
Manufacturer.all.destroy_all
Bike.all.destroy_all

# biker_count = 3;

## SEED Manufacturers
manu_json = File.read(manufacturer_seed_file_path)
manufacturer_hash = JSON.parse(manu_json)
manufacturer_hash["manufacturers"].each{|manu| Manufacturer.new(name: manu["name"], url: manu["company_url"]).save}

# biker_count.times{
#     Biker.new(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, user_name: Faker::Internet.username(specifier: 5..8), home_city:Faker::Address.city).save
# }

# ##SEED Bikes
# bike_types = ["Road","Mountain","Hybrid","Cruiser","Trike","Electric","Cargo","BMX","Custom"]
# bike_array = []
# File.open(bike_seed_file_path).each do |line|
#     bike_array << line.gsub("\n", "")  
# end

# Biker.all.each{|biker| 
#     rand(1..3).times{
#         Bike.new(bike_name: bike_array.sample(1)[0], biker_id: biker.id, bike_type: bike_types.sample(1)[0], manufacturer_id: Manufacturer.all.sample(1)[0].id, stolen: 0).save    
#     }
# }

# # ##SEED Trips
# Biker.all.each{|biker|
#     city_array = ["Seattle", "Olympia", "Vancouver", "Spokane", "Bellevue", "Redmond", "Everett"]   
#     #Take between 0 and 5 trips
#     (rand (0..5)).times{
#         start_loc = city_array.sample(1)[0]
#         dest_loc = (city_array.reject{|city| city == start_loc}).sample(1)[0]
#         rand_dist = (rand(1..100).to_f / 100.0) * rand(1..3000).to_f  # some random distance between 1 and 3000 miles
#         ActiveRecord::Base.transaction do
#             Trip.new(biker_id: biker.id, bike_id: biker.bikes[0].id, name: "#{start_loc} to: #{dest_loc}", start_city: start_loc, dest_city: dest_loc, distance_miles: rand_dist, start_date: 0, end_date: 0).save            
#         end
#         }
#     biker.save
#     #binding.pry
#     }

# ###SEED Trip Comments
# Biker.all.each{|biker|    
#     #Make between 1 and 5 comments
#     (rand (1...5)).times{
#         trip_to_comment_on = Trip.all[rand(0...Trip.all.count)]        
#         ActiveRecord::Base.transaction do
#             TripComment.new(trip_id: trip_to_comment_on.id, biker_id: biker.id, comment: Faker::Quote.famous_last_words).save  
#         end
#         }
#     biker.save
#     #binding.pry
#     }

puts "Seeded"
