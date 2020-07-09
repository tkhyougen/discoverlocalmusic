class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :localartist
  belongs_to :spot

end
