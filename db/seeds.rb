require 'open-uri'
require 'json'
require 'faker'

puts "Deleted all instances !"

Movie.destroy_all

puts "Deleted!"

puts "Adding the top movies from TMDB"

URL = "https://tmdb.lewagon.com/movie/top_rated"

movies = JSON.parse(URI(URL).read)

movies["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie["vote_average"]
  )
end

puts "Added"

puts "Created 10 lists"

10.times do
  List.create(name: Faker::Movie.quote)
end
