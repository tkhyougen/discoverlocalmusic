class Localartist < ApplicationRecord
  #アソシエーション　ex.localartists.user.name
  belongs_to :user

  acts_as_taggable
end
