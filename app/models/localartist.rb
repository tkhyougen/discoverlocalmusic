class Localartist < ApplicationRecord
  #アソシエーション　ex.localartists.user.name
  belongs_to :user


  has_many :comments, dependent: :destroy  #localaritstに対するコメントをネスト

  acts_as_taggable
end
