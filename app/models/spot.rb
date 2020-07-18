class Spot < ApplicationRecord

  belongs_to :user
  has_many :spotcomments, dependent: :destroy

  before_validation {name.capitalize!}
  validates :name, presence: true, length:{ maximum:20 },uniqueness: true
  before_validation {country.capitalize!}
  validates :country, presence: true, length:{ maximum:20 }
  validates :post_comment, length:{ maximum:255 }

  #favoriteのアソシエーション
  has_many :spotfavorites, dependent: :destroy
  has_many :spotfavorite_users, through: :spotfavorites, source: :user

  #spotのmap検索
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #画像アップロード
  mount_uploader :image, ImageUploader
  
end
