class Localartist < ApplicationRecord
  #アソシエーション　ex.localartits.user.name
  belongs_to :user
end
