class Building < ApplicationRecord
  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 3, maximum: 70 }
  validates :description, presence: true, length: { minimum: 5, maximum: 255 }
  validates :photo, presence: true
end
