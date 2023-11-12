# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :article do
    link_to_default_image = Rails.root.join('spec/files/images/image6.jpg')

    name_ru { Faker::Lorem.characters(number: 10) }
    name_en { Faker::Lorem.characters(number: 10) }
    name_be { Faker::Lorem.characters(number: 10) }
    description_ru { Faker::Lorem.characters(number: 30) }
    description_en { Faker::Lorem.characters(number: 30) }
    description_be { Faker::Lorem.characters(number: 30) }

    after :build do |article|
      article.images.attach(io: File.open(link_to_default_image), filename: 'image6.jpg', content_type: 'image/jpg')
    end
  end
end
