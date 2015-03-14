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


50.times do |n|
  headers = { :accept => 'application/json' }
  response = JSON.parse(RestClient.get "http://api.themoviedb.org/3/tv/#{n+1}?api_key=624db803deeb9f8d71bb99dfdbfbd026", headers)

  TvShow.create!(name: response["name"],
                 created_by: response["created_by"][0].nil? ? nil : response["created_by"][0]["name"],
                 seasons: response["number_of_seasons"],
                 episodes: response["number_of_episodes"],
                 first_air_date: response["first_air_date"],
                 last_air_date: response["last_air_date"],
                 overview: response["overview"],
                 poster_path: response["poster_path"].nil? ? nil : "https://image.tmdb.org/t/p/w185#{response["poster_path"]}",
                 status: response["status"],
                 rating: response["vote_average"],
                 votes: response["vote_count"])
end

