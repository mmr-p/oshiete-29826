class Tag < ApplicationRecord
  has_many :restaurant_tag_relations, dependent: :destroy
  has_many :restaurants,              through: :restaurant_tag_relations

  validates :name, uniqueness: true
end
