User.destroy_all
Tweet.delete_all
Favorite.delete_all
Dm.delete_all
user1 = User.create!(name: "永田", profile_image: "写真", age: 24, place: "愛知県", content: "よろしくお願いします", using_reason: "子供の為に", email: "a@a", password: "aaaaaa")

user2 = User.create!(name: "遠藤", profile_image: "写真", age: 25, place: "東京", content: "初めまして", using_reason: "妹の為に", email: "b@b", password: "bbbbbb")

user3 = User.create!(name: "たけ", profile_image: "写真", age: 38, place: "大阪県", content: "皆さんこんにちは", using_reason: "親の為に", email: "c@c", password: "cccccc")

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

movie45 = Movie.create!(title: "", url: "youtube.com/watch?v=j3oPs2CJ_6I&feature=emb_rel_pause")
movie5 = Movie.create!(title: "", url: "https://www.youtube.com/watch?v=j3oPs2CJ_6I&feature=emb_rel_pause")
movie6 = Movie.create!(title: "", url: "https://www.youtube.com/watch?v=j3oPs2CJ_6I&feature=emb_rel_pause")
movie7 = Movie.create!(title: "", url: "https://www.youtube.com/watch?v=j3oPs2CJ_6I&feature=emb_rel_pause")
movie8 = Movie.create!(title: "", url: "https://www.youtube.com/watch?v=j3oPs2CJ_6I&feature=emb_rel_pause")
movie9 = Movie.create!(title: "", url: "https://www.youtube.com/embed/x_KeaEUr3jo")
movie10 = Movie.create!(title: "", url: "https://www.youtube.com/embed/EAjXnT0f5zk")
movie11 = Movie.create!(title: "", url: "https://www.youtube.com/embed/yjhUDrjoJ5M")
movie12 = Movie.create!(title: "", url: "https://www.youtube.com/embed/Outcx4StSyU")
movie13 = Movie.create!(title: "", url: "https://www.youtube.com/embed/DDBiKpcvZp0")
movie14 = Movie.create!(title: "", url: "https://www.youtube.com/embed/wvkK06fdR3Q")
movie15 = Movie.create!(title: "", url: "https://www.youtube.com/embed/O6tARRY81xM")
movie16 = Movie.create!(title: "", url: "https://www.youtube.com/embed/R4GYLo9S7vQ")
movie17 = Movie.create!(title: "", url: "https://www.youtube.com/embed/cdz-cs_kYto")
movie18 = Movie.create!(title: "", url: "https://www.youtube.com/embed/JispFS6zeDw")
movie19 = Movie.create!(title: "", url: "https://www.youtube.com/embed/FIfbOSy1Bzg")
movie20 = Movie.create!(title: "", url: "https://www.youtube.com/embed/BVv2JNnkKfU")
movie21 = Movie.create!(title: "", url: "https://www.youtube.com/embed/TFrYp4J6KLY")
movie22 = Movie.create!(title: "", url: "https://www.youtube.com/embed/U3yqlU7HGnk")
movie23 = Movie.create!(title: "", url: "https://www.youtube.com/embed/SOLT-5evKQQ")

puts "成功しました"
