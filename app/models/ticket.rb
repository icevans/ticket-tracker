class Ticket < ApplicationRecord
  belongs_to :project
  has_many :taggings
  has_many :tags, through: :taggings
end
