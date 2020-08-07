class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_entries, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :favorites_tweet, through: :favorites, source: :tweet

  has_many :event_entries_events, through: :event_entries, source: :event

  mount_uploader :profile_image, ImageUploader

  has_many :active_dms, class_name: "Dm",
                        foreign_key: "send_user_id",
                        dependent: :destroy
  has_many :passive_dms, class_name: "Dm",
                         foreign_key: "receive_user_id",
                         dependent: :destroy
  has_many :send_dms, through: :active_dms, source: :receive_user
  has_many :receive_dms, through: :passive_dms, source: :send_user
end
