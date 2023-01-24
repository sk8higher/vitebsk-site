# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Create random Buildings
# 10.times do
# name = Faker::Commerce.product_name
# description = Faker::Lorem.paragraph(sentence_count: 5)

# building = Building.create(name: name, description: description)
# file_path = Rails.root.join('app', 'assets', 'images', 'vitebsk-photo.jpg')
# building.photo.attach(io: File.open(file_path), filename: 'vitebsk-photo.jpg')

# building.save
# end

# Create random Monuments
# 15.times do
# name = Faker::Commerce.product_name
# description = Faker::Lorem.paragraph(sentence_count: 5)

# monument = Monument.create(name: name, description: description)
# file_path = Rails.root.join('app', 'assets', 'images', 'image2.png')
# monument.photo.attach(io: File.open(file_path), filename: 'image2.png')

# monument.save
# end

# Create random Museums
# 15.times do
# name = Faker::Commerce.product_name
# description = Faker::Lorem.paragraph(sentence_count: 5)

# museum = Museum.create(name: name, description: description)
# file_path = Rails.root.join('app', 'assets', 'images', 'image3.png')
# museum.photo.attach(io: File.open(file_path), filename: 'image3.png')

# museum.save
# end

# Create random People
# 15.times do
#   name = Faker::Commerce.product_name
#   bio = Faker::Lorem.paragraph(sentence_count: 5)

#   person = Person.create(name: name, bio: bio)
#   file_path = Rails.root.join('app', 'assets', 'images', 'image4.jpg')
#   person.photo.attach(io: File.open(file_path), filename: 'image4.png')

#   person.save
# end

# Create tags
Tag.create(name: 'Художник')
Tag.create(name: 'Поэт')
Tag.create(name: 'Писатель')
