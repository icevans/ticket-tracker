class User < ApplicationRecord
  has_secure_password
  has_many :tickets, class_name: 'Ticket', foreign_key: 'creator_id'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
