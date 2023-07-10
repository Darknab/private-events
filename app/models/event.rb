class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :participations, foreign_key: "attendee_id"
    has_many :attendees, class_name: "User", through: :participations, source: :attendee
end