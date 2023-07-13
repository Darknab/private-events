class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :participations, foreign_key: "attended_event_id"
  has_many :attendees, class_name: "User", through: :participations, source: :attendee

  scope :upcoming, -> {where("date > ?", DateTime.now)}
  scope :past, -> {where("date < ?", DateTime.now)}

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true, :date_cannot_be_in_the_past
  validates :category, inclusion: {in: %w(Public Private), "%{value} is not valid"}

  def date_cannot_be_in_the_past
    if date.present? && date < DateTime.now()
      errors.add(:date, "can't be in the past")
    end
  end
end