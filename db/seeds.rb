require 'open-uri'
require 'json'
require 'faker'

puts 'Deleted all instances !'

# if Rails.env.development?
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
# end

puts 'Deleted!'

puts 'Creating lists'
puts "1st list 'Thriller'"
thriller_photo = URI.open('https://res.cloudinary.com/dxcrr7aon/image/upload/v1653040665/dostymmxma9xeomlz1uu.jpg')
thriller = List.new(name: 'Thriller')
thriller.photo.attach(io: thriller_photo, filename: 'thriller.jpg', content_type: 'image/jpg')
thriller.save

puts "2st list 'Comedy'"
comedy_photo = URI.open('https://res.cloudinary.com/dxcrr7aon/image/upload/v1653040586/ubykbsfdzyepgufdnkhw.jpg')
comedy = List.new(name: 'Comedy')
comedy.photo.attach(io: comedy_photo, filename: 'comedy.jpg', content_type: 'image/jpg')
comedy.save

puts "3st list 'Drama'"
drama_photo = URI.open('https://res.cloudinary.com/dxcrr7aon/image/upload/v1653040611/xk5raribc6ioulnphwvy.jpg')
drama = List.new(name: 'Drama')
drama.photo.attach(io: drama_photo, filename: 'drama.jpg', content_type: 'image/jpg')
drama.save

puts "4st list 'Musical'"
musical_photo = URI.open('https://res.cloudinary.com/dxcrr7aon/image/upload/v1653040603/cqilwsxhjk7nrojt585u.jpg')
musical = List.new(name: 'Musical')
musical.photo.attach(io: musical_photo, filename: 'musical.jpg', content_type: 'image/jpg')
musical.save

puts "5st list 'Cartoon'"
cartoon_photo = URI.open('https://res.cloudinary.com/dxcrr7aon/image/upload/v1653040593/d7aw1lqlnemjsggfwrd2.jpg')
cartoon = List.new(name: 'Cartoon')
cartoon.photo.attach(io: cartoon_photo, filename: 'cartoon.jpg', content_type: 'image/jpg')
cartoon.save

list_array = [thriller, comedy, drama, musical, cartoon]

puts 'Lists created!'

puts 'Fetching top movies from TMDB and add them to lists'

movies = JSON.parse(URI('https://tmdb.lewagon.com/movie/top_rated').read)

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
