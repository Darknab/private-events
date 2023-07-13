class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :participations, foreign_key: "attended_event_id"
  has_many :attendees, class_name: "User", through: :participations, source: :attendee

  scope :upcoming, -> {where("date > ?", DateTime.now)}
  scope :past, -> {where("date < ?", DateTime.now)}
  scope :public_event, -> {where("category = ?", "Public") }

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true, inclusion: {in: (DateTime.now..), message: "invalid date" }
  validates :category, inclusion: {in: %w(Public Private), message: "%{value} is not valid"}

  
end