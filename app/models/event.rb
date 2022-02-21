class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  
  has_many :event_attendances
  has_many :attendees, through: :event_attendances, source: :attendee

  validates :name, uniqueness: true, presence: true
  validates :date, presence: true
  validate :invalid_date

  scope :past, -> {where("date < ?", Date.today)}
  scope :upcoming, -> {where("date >= ?", Date.today)}

  private

  def invalid_date
    return if date.nil?
    unless date > Date.yesterday
      errors.add(:date, 'can\'t be in the past, stupid')
    end
  end
end
