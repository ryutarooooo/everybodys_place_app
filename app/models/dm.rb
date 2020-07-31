class Dm < ApplicationRecord
  belongs_to :user
  belongs_to :dm_room
  belongs_to :send_user, class_name: "User"
  belongs_to :receive_user, class_name: "User"
  validates :send_user_id, presence: true
  validates :receive_user_id, presence: true
  validates :content, presence: true

  after_create_commit { DmBroadcastJob.perform_later self }
end
