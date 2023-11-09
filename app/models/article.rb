# frozen_string_literal: true

class Article < ApplicationRecord
  include Pagy::Backend
  extend Mobility

  translates :name, type: :string, column_fallback: %i[ru]
  translates :description, type: :string, column_fallback: %i[ru]

  has_many_attached :images

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :images, presence: true
end
