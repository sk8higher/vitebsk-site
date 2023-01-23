class Person < ApplicationRecord
  has_many :artworks

  has_one_attached :photo
end
