class UserCountryLabelling < ApplicationRecord

  #ユーザーとユーザーが登録する国の中間テーブルとなる
  belongs_to :user
  belongs_to :user_country_label

end
