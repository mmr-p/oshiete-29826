class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :restaurants
  has_many :comments
  has_many :messages, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name,        format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'の入力が正しくありません' }
    validates :name_kana,   format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
    validates :employee_id, format: { with: /\A[0-9]+\z/, message: 'は半角で入力してください' }
    validates :password,    format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英数字混合で入力してください' }
  end
end
