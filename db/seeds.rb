# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


universal = Studio.create!(name: "Universal Pictures", location: "Universal City, CA")
warner = Studio.create!(name: "Warner Bros", location: "Hollywood, CA")
paramount = Studio.create!(name: "Paramount Pictures", location: "Los Angeles, CA")

jurassic = universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action")
jurassic2 = universal.movies.create!(title: "Jurassic World", creation_year: 2015, genre: "Action")
harry = warner.movies.create!(title: "Harry Potter and the Sorcerer's Stone", creation_year: 2001, genre: "Fantasy")
harry2 = warner.movies.create!(title: "Harry Potter and the Chamber of Secrets", creation_year: 2002, genre: "Fantasy")
shrek = paramount.movies.create!(title: "Shrek", creation_year: 2001, genre: "Comedy")
shrek2 = paramount.movies.create!(title: "Shrek 2", creation_year: 2004, genre: "Comedy")