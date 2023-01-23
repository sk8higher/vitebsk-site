class Artwork < ApplicationRecord
  include Pagy::Backend

  belongs_to :person

  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 3 }
  validates :descripton, presence: true, length: { minimum: 5 }
end
