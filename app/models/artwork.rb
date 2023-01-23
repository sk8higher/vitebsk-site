class Artwork < ApplicationRecord
  include Pagy::Backend

  belongs_to :person

  has_one_attached :photo

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
end
