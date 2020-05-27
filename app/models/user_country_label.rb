class UserCountryLabel < ApplicationRecord

  #user_country_labellingsを中間とし、userにアクセス
  has_many :user_country_labellings, dependent:destroy
  has_many :user_country_labelling_users, through: :user_country_labellings, source: :user
end
