class Restaurant < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :ambiance
  belongs_to_active_hash :price

  belongs_to       :user
  has_one_attached :image
  has_many         :comments, dependent: :destroy
  has_many         :restaurant_tag_relations, dependent: :destroy
  has_many         :tags, through: :restaurant_tag_relations

  with_options presence: true do
    validates :name
    validates :description
    validates :genre_id
    validates :ambiance_id
    validates :price_id
    validates :image
    # 電話番号はハイフンなし
    validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'の入力が正しくありません' }
    validates :address
    validates :opening_hour
    validates :closed
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :genre_id
    validates :ambiance_id
    validates :price_id
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    if search != ''
      Restaurant.where('name LIKE(?)', "%#{search}%").
        or(where('description LIKE(?)', "%#{search}%")).
        or(where('address LIKE(?)', "%#{search}%")).
        or(where('opening_hour LIKE(?)', "%#{search}%"))
                .or(where('closed LIKE(?)', "%#{search}%"))
    else
      Restaurant.order('created_at DESC')
    end
  end

  def save_tags(saved_restaurant_tags)
    saved_restaurant_tags.each do |new_name|
      restaurant_tag = Tag.find_or_create_by(name: new_name)
      self.tag << restaurant_tag
    end
  end
end
