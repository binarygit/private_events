class Event < ApplicationRecord
  include Comparable
  belongs_to :creator, class_name: 'User'
  
  has_many :event_attendances
  has_many :attendees, through: :event_attendances, source: :user

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true, length: { minimum: 10 } 
  validates :date, presence: true
  validate :invalid_date

  private

  def invalid_date
    return if date.nil?
    unless date > Date.yesterday
      errors.add(:date, 'can\'t be in the past, stupid')
    end
  end
end
