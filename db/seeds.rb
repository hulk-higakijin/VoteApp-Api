User.create(name: "名無し侍", email: "samurai@noname.com", password: "nanashizamurai", password_confirmation: "nanashizamurai")
User.create(name: "野生のミシシッピズワイガニ", email: "wild@zuwai.kani.com", password: "wildkanikani", password_confirmation: "wildkanikani")

array = ["岸田内閣を支持する?", "アメリカ中間選挙、どっちを応援する？（赤→共和党、青→民主党）", "選択的夫婦別姓に賛成？", "来年の参議院選挙の投票に行く？"]
Post.create(topic: array[0], agree_count: 48, disagree_count: 52, user_id: 1, is_published: true)
Post.create(topic: array[1], agree_count: 51, disagree_count: 49, user_id: 2, is_published: true)
Post.create(topic: array[2], agree_count: 27, disagree_count: 73, user_id: 1, is_published: true)
Post.create(topic: array[3], agree_count: 42, disagree_count: 58, user_id: 2, is_published: true)

p "初期データの作成をしました。"