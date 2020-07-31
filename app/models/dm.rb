class Dm < ApplicationRecord
  belongs_to :send_user, class_name: "User"
  belongs_to :receive_user, class_name: "User"
  validates :send_user_id, presence: true
  validates :receive_user_id, presence: true
end
