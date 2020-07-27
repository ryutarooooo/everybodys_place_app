class Child < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: { scope: :position }
  validates :position, presence: true
end
