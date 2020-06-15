class Comment < ApplicationRecord
  belongs_to :localartist
  belongs_to :user
  validates :content, presence: true
end
