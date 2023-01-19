# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  name = Faker::Commerce.product_name
  description = Faker::Lorem.paragraph(sentence_count: 5)

  building = Building.create(name: name, description: description)
  file_path = Rails.root.join('app', 'assets', 'images', 'vitebsk-photo.jpg')
  building.photo.attach(io: File.open(file_path), filename: 'vitebsk-photo.jpg')

  building.save
end
