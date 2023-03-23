# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :museum do
    link_to_default_image = Rails.root.join('spec/files/images/image3.jpg')
    photo { Rack::Test::UploadedFile.new link_to_default_image, 'image/jpg' }
    name_ru { Faker::Lorem.characters(number: 10) }
    name_en { Faker::Lorem.characters(number: 10) }
    description_ru { Faker::Lorem.characters(number: 15) }
    description_en { Faker::Lorem.characters(number: 15) }
  end
end
