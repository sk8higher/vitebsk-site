# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :artwork do
    link_to_default_image = "#{Rails.root}/spec/files/images/image5.jpg"
    photo { Rack::Test::UploadedFile.new link_to_default_image, 'image/jpg' }
    title { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 15) }
    person_id { nil }
  end
end
