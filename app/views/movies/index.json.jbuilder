json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :year, :genre, :actors, :metascore, :imdbscore, :user_rating
  json.url movie_url(movie, format: :json)
end
