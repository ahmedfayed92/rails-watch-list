# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning db.."

Movie.destroy_all

puts "populating db.."
url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)
movies["results"].each do |movie|
  # puts "#{movie["title"]} - #{movie["overview"]} #{movie["vote_average"]} #{movie["poster_path"]}"
  Movie.create(title: movie["title"], overview: movie["overview"], rating: movie["vote_average"], poster_url: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}")
end
