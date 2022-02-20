class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  validates :name, uniqueness: true
end
