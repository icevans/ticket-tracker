class User < ApplicationRecord
  has_secure_password
  has_many :tickets, class_name: 'Ticket', foreign_key: 'creator_id'
  has_many :assigned_tickets, class_name: 'Ticket', foreign_key: 'assignee_id'
  has_many :comments
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
