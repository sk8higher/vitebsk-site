class Tag < ApplicationRecord
  has_many :taggings
  has_many :people, through: :taggings
end
