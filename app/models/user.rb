class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length:{ maximum:20 }

  #emailをすべて小文字に強制変換
  before_validation {email.downcase!}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :comment, length:{ maximum:255 }


  #以下アソシエーション
  has_many :user_country_labellings, dependent: :destroy
  has_many :user_country_labelling_user_country_labels, through: :user_country_labellings, source: :user_country_label

  #user.localartists
  has_many :localartists, dependent: :destroy
  has_many :comments, dependent: :destroy

  #user.spots
  has_many :spots, dependent: :destroy
  has_many :spotcomments, dependent: :destroy

  #localartsitのfavorite
  has_many :favorites, dependent: :destroy
  has_many :favorite_localartists, through: :favorites, source: :localartist

  #spotのfavorite
  has_many :spotfavorites, dependent: :destroy
  has_many :spotfavorite_spots, through: :spotfavorites, source: :spot

  #画像アップロード
  mount_uploader :image, ImageUploader

  #acts-as-tagable gemで以下のラベルを追加
  acts_as_taggable
end
