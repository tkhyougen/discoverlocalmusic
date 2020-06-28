class Spot < ApplicationRecord

  belongs_to :user


  validates :name, presence: true, length:{ maximum:20 },uniqueness: true
  validates :country, presence: true, length:{ maximum:20 }
  validates :post_comment, length:{ maximum:255 }

end
