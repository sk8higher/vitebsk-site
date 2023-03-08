require 'faker'

FactoryBot.define do
  factory :building do
    link_to_default_image = "#{Rails.root}/spec/files/images/image1.png"
    photo { Rack::Test::UploadedFile.new link_to_default_image, "image/jpg" }
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 15) }
  end
end
