class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id'
  has_many :taggings
  has_many :tags, through: :taggings
end
