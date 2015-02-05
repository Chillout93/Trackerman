# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Nick Spicer",
             email: "nickspicer93@gmail.com",
             password: "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  User.create!(name: name, 
               email: "example-#{n+1}@example.org",
               password: "password",
               password_confirmation: "password",
               activated: true,
               activated_at: Time.zone.now) 
end