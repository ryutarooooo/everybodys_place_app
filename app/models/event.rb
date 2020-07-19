class Event < ApplicationRecord
  belongs_to :user
  has_many :event_comments, dependent: :destroy
  has_many :event_entries, dependent: :destroy

  has_many :event_entries_users, through: :event_entries, source: :user
end
