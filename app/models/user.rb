class User < ApplicationRecord
  has_secure_password
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :name, presence: true
end
