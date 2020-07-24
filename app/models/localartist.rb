class Localartist < ApplicationRecord

  before_validation {name.capitalize!}
  validates :name, presence: true, length:{ maximum:30 },uniqueness: true
  before_validation {country.capitalize!}
  validates :country, presence: true, length:{ maximum:20 }
  validates :post_comment, length:{ maximum:255 }

  #アソシエーション　ex.localartists.user.name
  belongs_to :user
  has_many :comments, dependent: :destroy  #localaritstに対するコメントをネスト

  #ラベル機能に必要
  acts_as_taggable

  #favorite機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  #画像アップロード
  mount_uploader :image, ImageUploader

end
