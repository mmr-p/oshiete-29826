class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :restaurants

  with_options presence: true do
    validates :name,        format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :name_kana,   format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :employee_id, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  end
end
