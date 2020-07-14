Comment.create!(user_id: 3, tweet_id: 2, title: "こんばんは", content: "おはよう")
Comment.create!(user_id: 1, tweet_id: 3, title: "朝になりました", content: "こんにちは")
Comment.create!(user_id: 2, tweet_id: 1, title: "夜になりました", content: "こんばんは")
Comment.create!(user_id: 1, tweet_id: 2, title: "今日は勉強します", content: "テスト")
Comment.create!(user_id: 2, tweet_id: 3, title: "もう限界です", content: "おやすみ")

puts "成功しました"
