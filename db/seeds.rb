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
