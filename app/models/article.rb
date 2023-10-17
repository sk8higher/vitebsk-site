class Article < ApplicationRecord
  include Pagy::Backend
  extend Mobility

  translates :name, type: :string, column_fallback: %i[ru]

  has_many_attached :images

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :images, presence: true
end
