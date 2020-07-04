class Spot < ApplicationRecord

  belongs_to :user
  has_many :spotcomments, dependent: :destroy

  validates :name, presence: true, length:{ maximum:20 },uniqueness: true
  before_validation {country.capitalize!}
  validates :country, presence: true, length:{ maximum:20 }
  validates :post_comment, length:{ maximum:255 }

end
