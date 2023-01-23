class Artwork < ApplicationRecord
  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 3 }
  validates :descripton, presence: true, length: { minimum: 5 }
end
