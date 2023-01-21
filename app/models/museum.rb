class Museum < ApplicationRecord
  include Pagy::Backend

  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 3, maximum: 70 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :photo, presence: true
end
