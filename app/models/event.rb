class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :participations, foreign_key: "attended_event_id"
    has_many :attendees, class_name: "User", through: :participations, source: :attendee
    scope :upcoming, -> {where("date > ?", DateTime.now)}
    scope :past, -> {where("date < ?", DateTime.now)}
end