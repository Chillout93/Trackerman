json.array!(@tv_shows) do |tv_show|
  json.extract! tv_show, :id, :name, :created_by, :season, :episodes, :first_air_date, :last_air_date, :overview, :poster_path, :status, :rating, :votes
  json.url tv_show_url(tv_show, format: :json)
end
