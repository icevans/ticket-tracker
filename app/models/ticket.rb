class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :taggings
  has_many :tags, through: :taggings
end
