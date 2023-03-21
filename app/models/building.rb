# frozen_string_literal: true

class Building < ApplicationRecord
  include Pagy::Backend
  extend Mobility

  translates :name, type: :string
  translates :description, type: :string

  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 3, maximum: 70 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :photo, presence: true
end
