# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :artwork do
    link_to_default_image = Rails.root.join('spec/files/images/image5.jpg')
    photo { Rack::Test::UploadedFile.new link_to_default_image, 'image/jpg' }
    title_ru { Faker::Lorem.characters(number: 10) }
    title_en { Faker::Lorem.characters(number: 10) }
    description_ru { Faker::Lorem.characters(number: 15) }
    description_en { Faker::Lorem.characters(number: 15) }
    person_id { nil }
  end
end
