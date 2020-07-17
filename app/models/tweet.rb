class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # tweet.favorite_users で tweets を「いいね!」しているユーザー一覧が取得できるようになる
  has_many :favorites_users, through: :favorites, source: :user
end
