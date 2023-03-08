require 'faker'

FactoryBot.define do
  factory :museum do
    link_to_default_image = "#{Rails.root}/spec/files/images/image3.jpg"
    photo { Rack::Test::UploadedFile.new link_to_default_image, "image/jpg" }
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 15) }
  end
end
