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

headers = { :accept => 'application/json' }
on_the_air = JSON.parse(RestClient.get "http://api.themoviedb.org/3/tv/on_the_air?api_key=624db803deeb9f8d71bb99dfdbfbd026", headers)

on_the_air["results"].each do |n|
  headers = { :accept => 'application/json' }
  response = JSON.parse(RestClient.get "http://api.themoviedb.org/3/tv/#{n["id"]}?api_key=624db803deeb9f8d71bb99dfdbfbd026", headers)

  if response 
    @tv_show = TvShow.create!(
                   id: response["id"],
                   name: response["name"],
                   created_by: response["created_by"][0].nil? ? nil : response["created_by"][0]["name"],
                   no_of_seasons: response["number_of_seasons"],
                   no_of_episodes: response["number_of_episodes"],
                   first_air_date: response["first_air_date"],
                   last_air_date: response["last_air_date"],
                   overview: response["overview"],
                   poster_path: response["poster_path"].nil? ? nil : "https://image.tmdb.org/t/p/w185#{response["poster_path"]}",
                   status: response["status"],
                   rating: response["vote_average"],
                   votes: response["vote_count"])

    response["seasons"].each do |season|
      season_response = JSON.parse(RestClient.get "http://api.themoviedb.org/3/tv/#{@tv_show.id}/season/#{season["season_number"]}?api_key=624db803deeb9f8d71bb99dfdbfbd026", headers)
      @season = @tv_show.seasons.create!(id: season_response["id"],
                                       season_number: season_response["season_number"],
                                       name: season_response["name"],
                                       air_date: season_response["air_date"],
                                       overview: season_response["overview"],
                                       poster_path: season_response["poster_path"].nil? ? nil : "https://image.tmdb.org/t/p/w185#{response["poster_path"]}")

      season_response["episodes"].each do |episode|
        @season.episodes.create!(id: episode["id"],
                               episode_number: episode["episode_number"],
                               air_date: episode["air_date"],
                               name: episode["name"],
                               overview: episode["overview"],
                               still_path: episode["still_path"].nil? ? nil : "https://image.tmdb.org/t/p/w185#{episode["still_path"]}",
                               vote_average: episode["vote_average"],
                               vote_count: episode["vote_count"])
      end
    end
  end
end

