# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "initializing seed"
require 'faker'

puts 'Cleaning database...'
User.destroy_all

puts 'Creating 50 fake users...'
50.times do
  user = User.new(
    first_name:    Faker::Name.first_name,
    last_name:     Faker::Name.last_name,
    age:           rand(18..60),
    phone_number:  (Faker::PhoneNumber.phone_number).to_i,
    role:          ["dj", "customer"].sample,
    username:      Faker::Internet.username,
    email:         Faker::Internet.email,
    password:      "123456"
  )
  user.save!
end
puts 'Finished!'

puts 'Creating 80 fake offers...'
80.times do
  offer = Offer.new(
    availability:  Faker::Date.between(from: '2023-08-23', to: '2023-12-25'),
    pricing:       rand(100..1000),
    social_media:  ["instagram", "facebook", "twitter"].sample,
    style:         ["house", "techno", "disco", "hip-hop", "rock", "pop", "jazz", "funk"].sample,
    content:       Faker::Lorem.paragraph,
    #i want a random user_id in all the user_id that is a dj
    user_id:       User.where(role: "dj").sample.id
  )
  offer.save!
end
puts 'Finished!'

puts 'Creating 110 fake bookings...'
110.times do
  booking = Booking.new(
    date:         Faker::Date.between(from: '2023-08-23', to: '2023-12-25'),
    hour:         Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    price:        rand(100..1000),
    comment:      Faker::Lorem.paragraph,
    acceptation:  [false].sample,
    #i want a random user_id in all the user_id that is a customer
    user_id:      User.where(role: "customer").sample.id,
    #i want a random offer_id in all the offer_id
    offer_id:     Offer.all.sample.id
  )
  booking.save!
end
puts 'Finished!'

puts 'Creating 200 fake reviews...'
200.times do
  review = Review.new(
    rating:  rand(0..5),
    content: Faker::Lorem.paragraph,
    #i want a random user_id in all the user_id that is a customer
    user_id: User.where(role: "customer").sample.id
  )
  review.save!
end
puts 'Finished!'
