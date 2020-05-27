class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length:{ maximum:20 }
  validates :email, presence: true, uniqueness: true
  validates :comment, length:{ maximum:255 }

  has_many :user_country_labellings, dependent: :destroy
  has_many :user_country_labelling_user_country_labels, through: :user_country_labellings, source: :user_country_label
  mount_uploader :iamge, ImageUploader
end
