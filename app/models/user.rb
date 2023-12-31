class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  has_many :participations, foreign_key: "attendee_id"
  has_many :attended_events, through: :participations, source: :attended_event

  has_many :friendships, foreign_key: "follower_id"
  has_many :friendships, foreign_key: "followed_user_id"

  has_many :followers, through: :friendships, source: :follower

  has_many :followed_users, through: :friendships, source: :followed_user

 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :adress, presence: true

end
