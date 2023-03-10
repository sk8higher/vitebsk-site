# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :person do
    link_to_default_image = "#{Rails.root}/spec/files/images/image4.jpg"
    photo { Rack::Test::UploadedFile.new link_to_default_image, 'image/jpg' }
    name { Faker::Lorem.characters(number: 10) }
    bio { Faker::Lorem.characters(number: 15) }
    tag_id { nil }
  end
end
