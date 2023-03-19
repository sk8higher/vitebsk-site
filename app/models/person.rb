# frozen_string_literal: true

class Person < ApplicationRecord
  include Pagy::Backend

  scope :tag, ->(tag) { where(tag:) }

  has_many :artworks, dependent: :destroy

  has_one_attached :photo

  belongs_to :tag

  validates :name, presence: true, length: { minimum: 3, maximum: 70 }
  validates :bio, presence: true, length: { minimum: 5 }
  validates :photo, presence: true
end
