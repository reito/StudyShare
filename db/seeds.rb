# ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             point: 80)

20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               point: 20)
end

20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+21}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               point: 60)
end

20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+41}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               point: 40)
end

20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+61}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               point: 120)
end

20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+81}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               point: 100)
end

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.sentence(5)
    subject = rand(1..4)
    users.each { |user| user.microposts.create!(content: content, subject: "#{subject}") }
end

# リレーションシップ
users = User.all
user = User.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }