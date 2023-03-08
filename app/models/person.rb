class Person < ApplicationRecord
  include Pagy::Backend

  scope :tag, lambda { |tag| where('tag = ?', tag) }

  has_many :artworks

  has_one_attached :photo

  belongs_to :tag

  validates :name, presence: true, length: { minimum: 3, maximum: 70 }
  validates :bio, presence: true, length: { minimum: 5 }
  validates :photo, presence: true
  validates :tag_id, presence: true
end
