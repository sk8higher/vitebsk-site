# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :person do
    link_to_default_image = Rails.root.join('spec/files/images/image4.jpg')
    photo { Rack::Test::UploadedFile.new link_to_default_image, 'image/jpg' }
    name_ru { Faker::Lorem.characters(number: 10) }
    name_en { Faker::Lorem.characters(number: 10) }
    bio_ru { Faker::Lorem.characters(number: 15) }
    bio_en { Faker::Lorem.characters(number: 15) }
    tag_id { nil }
  end
end
