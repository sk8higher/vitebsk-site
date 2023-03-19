require 'faker'

FactoryBot.define do
  factory :monument do
    link_to_default_image = "#{Rails.root}/spec/files/images/image2.png"
    photo { Rack::Test::UploadedFile.new link_to_default_image, 'image/png' }
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 15) }
  end
end
