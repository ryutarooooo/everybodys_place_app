class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :children, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_entries, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :favorites_tweet, through: :favorites, source: :tweet

  has_many :event_entries_events, through: :event_entries, source: :event

  mount_uploader :profile_image, ImageUploader

  validate :name, presence: true
  validate :age, presence: true
  validate :place, presence: true
  validate :gender, presence: true
end
