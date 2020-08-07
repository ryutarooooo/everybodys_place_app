User.destroy_all
Tweet.delete_all
Favorite.delete_all
Dm.delete_all
user1 = User.create!(name: "永田", profile_image: "写真", age: 24, place: "愛知県", content: "よろしくお願いします", using_reason: "子供の為に", email: "a@a", password: "aaaaaa")

user2 = User.create!(name: "遠藤", profile_image: "写真", age: 25, place: "東京", content: "初めまして", using_reason: "妹の為に", email: "b@b", password: "bbbbbb")

user3 = User.create!(name: "たけ", profile_image: "写真", age: 38, place: "大阪県", content: "皆さんこんにちは", using_reason: "親の為に", email: "c@c", password: "cccccc")

user4 = User.create!(name: "青井", profile_image: "写真", age: 16, place: "愛媛", content: "サッカー大好きです", using_reason: "親の為に", email: "d@d", password: "dddddd")

user5 = User.create!(name: "阿久津", profile_image: "写真", age: 17, place: "大阪県", content: "青井くんとは仲良しです。同じチームでサッカーやってます。", using_reason: "親の為に", email: "e@e", password: "eeeeee")

user6 = User.create!(name: "栗林", profile_image: "写真", age: 17, place: "鹿児島", content: "２０歳までに海外に行くのが夢です", using_reason: "親の為に", email: "f@f", password: "ffffff")

user7 = User.create!(name: "朝利マーチス", profile_image: "写真", age: 33, place: "群馬", content: "DOLCE&GABBANAっていう商品名がNGだから紅白出場出来ないらしく、Twitterで｢紅白出れないのも香水のせいかよ｣ってツイートあってめっちゃ笑った", using_reason: "親の為に", email: "g@g", password: "gggggg")

user8 = User.create!(name: "たけ", profile_image: "写真", age: 38, place: "大阪県", content: "皆さんこんにちは", using_reason: "親の為に", email: "h@h", password: "hhhhhh")

user9 = User.create!(name: "大友", profile_image: "写真", age: 5, place: "宮城", content: "しかし、表示に関わることをモデルに書くのはどうなんだろうという気がして、ヘルパーメソッドを作った方がいいんじゃないかと思いました。
そして調べてみたら、truncateというメソッドを見つけました。", using_reason: "しかし、表示に関わることをモデルに書くのはどうなんだろうという気がして、ヘルパーメソッドを作った方がいいんじゃないかと思いました。
そして調べてみたら、truncateというメソッドを見つけました。", email: "i@i", password: "iiiiii")

user10 = User.create!(name: "ActiveSupportでStringクラスに追加されたメソッドです。", profile_image: "写真", age: 38, place: "大分県山田市竹原村1ー17ー5", using_reason: "ヘルパーメソッドにもありました。省略後の文字数がオプションになっています。", email: "j@j", password: "jjjjjj")

tweet1 = Tweet.create(user_id: user1.id, title: "こんにちは", content: "6時に起きました", image: "太陽")
tweet2 = Tweet.create(user_id: user2.id, title: "おやすみなさい", content: "23時に寝ました", image: "月")
tweet3 = Tweet.create(user_id: user3.id, title: "お腹すいた", content: "12時に昼飯を食べました", image: "ラーメン")
tweet4 = Tweet.create(user_id: user3.id, title: "出かけました", content: "海に行きました", image: "海")
tweet5 = Tweet.create(user_id: user3.id, title: "運動しました", content: "サッカーやりました", image: "サッカーボール")

favorite1 = Favorite.create!(user_id: user1.id, tweet_id: tweet3.id)

favorite2 = Favorite.create!(user_id: user3.id, tweet_id: tweet1.id)

favorite3 = Favorite.create!(user_id: user2.id, tweet_id: tweet5.id)

favorite4 = Favorite.create!(user_id: user2.id, tweet_id: tweet3.id)

favorite5 = Favorite.create!(user_id: user1.id, tweet_id: tweet2.id)

dm1 = Dm.create!(send_user_id: user1.id, receive_user_id: user2.id, content: "a")
dm2 = Dm.create!(send_user_id: user1.id, receive_user_id: user3.id, content: "b")
dm3 = Dm.create!(send_user_id: user3.id, receive_user_id: user1.id, content: "c")

movie1 = Movie.create!(title: "不登校経験6年の先輩が、皆さんの質問に答えます！", url: "https://youtu.be/PBMmwJVngwo", category: "other")

movie2 = Movie.create!(title: "元不登校の僕が「周りの目」「悪口を言う人」から乗り越えた方法", url: "https://youtu.be/aOrkTyllAj4", category: "school")

movie3 = Movie.create!(title: "不登校の子供たちがありのままの自分を表現できる居場所を作りたい：コラボ配信", url: "https://youtu.be/6-m9OtoxRLE", category: "school")

movie4 = Movie.create!(title: "不登校で義務教育6年間勉強をしていなかった僕がたった1カ月の猛勉強で定時制高校に合格した話", url: "https://youtu.be/S_qcc8Tv7Yk", category: "test")

puts "成功しました"
