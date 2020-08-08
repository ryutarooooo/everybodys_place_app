class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  belongs_to :mention_user, class_name: "User"

  validates :content, presence: true

  # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
  after_create_commit { CommentBroadcastJob.perform_later self }
end
