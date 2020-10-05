class Restaurant < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :name
    validates :description
    validates :genre_id
    validates :ambiance_id
    validates :price_id
    # 電話番号はハイフンなし
    validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'の入力が正しくありません' }
    validates :address
    validates :opening_hour
    validates :closed
  end

  with_options numericality: { other_than: 1, message: '選択してください' } do
    validates :genre_id
    validates :ambiance_id
    validates :price_id
  end
end
