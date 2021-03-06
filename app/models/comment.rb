class Comment < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :ticket

  accepts_nested_attributes_for :ticket
end
