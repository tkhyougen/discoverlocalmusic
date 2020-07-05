class Localartist < ApplicationRecord
  #アソシエーション　ex.localartists.user.name
  belongs_to :user
  has_many :comments, dependent: :destroy  #localaritstに対するコメントをネスト

  validates :name, presence: true, length:{ maximum:20 },uniqueness: true
  before_validation {country.capitalize!}
  validates :country, presence: true, length:{ maximum:20 }
  validates :post_comment, length:{ maximum:255 }

  acts_as_taggable

end
