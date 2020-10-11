class Comment < ApplicationRecord
  belongs_to       :user
  belongs_to       :restaurant
  has_one_attached :image

  validates :content, presense: true
end
