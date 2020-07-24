#config/initializers/local.rbの:jaをコメントアウトしてからrails db:seed

5.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  comment = Faker::Quote.famous_last_words
  password = "password"
  User.create!(name: name,
               email: email,
               comment: comment,
               password: password,
               password_confirmation: password,
               )
end

20.times do |n|
  name1 = Faker::Music::RockBand.name
  country1 = Faker::Address.country
  post_comment1 = "for test"
  random = rand(1..5)
  Localartist.create!(name: name1,
                      country: country1,
                      post_comment: post_comment1,
                      user_id:random,
                      )
end
