# frozen_string_literal: true

class Artwork < ApplicationRecord
  include Pagy::Backend
  extend Mobility

  translates :title, type: :string, column_fallback: %i[ru]
  translates :description, type: :string, column_fallback: %i[ru]

  belongs_to :person

  has_one_attached :photo

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
end
