require 'open-uri'
require 'json'
require 'faker'

puts "Deleted all instances !"

if Rails.env.development
  Bookmark.destroy_all
  Movie.destroy_all
  List.destroy_all
end

puts "Deleted!"

puts "Adding the top movies from TMDB"

URL = "https://tmdb.lewagon.com/movie/top_rated"

movies = JSON.parse(URI(URL).read)

thriller = List.create(name: 'Thriller')
comedy = List.create(name: 'Comedy')
drama = List.create(name: 'Drama')
musical = List.create(name: 'Musical')
cartoon = List.create(name: 'Cartoon')

list_array = [thriller, comedy, drama, musical, cartoon]

movies['results'].each do |movie|
  movie = Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )

  Bookmark.create(
    comment: Faker::Movie.quote,
    movie_id: movie.id,
    list_id: list_array.sample.id
  )
end
