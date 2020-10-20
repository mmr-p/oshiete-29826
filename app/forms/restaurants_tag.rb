class RestaurantsTag
  # include ActiveModel::Model
  # attr_accessor :name, :description, :genre_id, :ambiance_id, :price_id,
  #               :tel, :address, :opening_hour, :closed, :image, :user_id

  # with_options presence: true do
  #   validates :name
  #   validates :description
  #   validates :genre_id
  #   validates :ambiance_id
  #   validates :price_id
  #   validates :image
  #   # 電話番号はハイフンなし
  #   validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'の入力が正しくありません' }
  #   validates :address
  #   validates :opening_hour
  #   validates :closed
  # end

  # with_options numericality: { other_than: 1, message: 'を選択してください' } do
  #   validates :genre_id
  #   validates :ambiance_id
  #   validates :price_id
  # end

  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

  # def save
  #   tweet = Restaurant.create(name: name, description: description, genre_id: genre_id,
  #                             ambiance_id: ambiance_id, price_id: price_id, tel: tel,
  #                             address: address, opening_hour: opening_hour, closed: closed,
  #                             image: image, user_id: user_id, tag_name: tag_name)
  #   tag = Tag.where(tag_name: tag_name).first_or_initialize
  #   tag.save

  #   RestaurantTagRelation.create(restaurant_id: restaurant.id, tag_id: tag.id)
  # end

  # def self.search(search)
  #   if search != ''
  #     Restaurant.where('name LIKE(?)', "%#{search}%").
  #       or(where('description LIKE(?)', "%#{search}%")).
  #       or(where('address LIKE(?)', "%#{search}%")).
  #       or(where('opening_hour LIKE(?)', "%#{search}%"))
  #               .or(where('closed LIKE(?)', "%#{search}%"))
  #   else
  #     Restaurant.order('created_at DESC')
  #   end
  # end
end
