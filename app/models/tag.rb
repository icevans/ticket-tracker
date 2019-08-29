class Tag < ApplicationRecord
  has_many :taggings
  has_many :tickets, through: :taggings

  validates :name, presence: true, length: { minimum: 3 }
end
