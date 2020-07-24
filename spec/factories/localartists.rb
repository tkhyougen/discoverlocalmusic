FactoryBot.define do
  factory :localartist do
    name {"aaa"}
    country {"Japan"}
    post_comment {"aaaaaaa"}
    user_id { 1 }
  end

  factory :second_localartist, class: Localartist do
    name {"bbb"}
    country {"USA"}
    post_comment {"bbbbbb"}
    user_id { 1 }
  end

end
