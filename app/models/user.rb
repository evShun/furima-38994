class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z\d]+\z/ }

  validates :nickname         , presence: true
  validates :family_name      , presence: true , format: { with:/\A[ぁ-んァ-ン一-龥]/ ,message: '全角文字を使用してください'}
  validates :first_name       , presence: true , format: { with:/\A[ぁ-んァ-ン一-龥]/ ,message: '全角文字を使用してください'}
  validates :family_name_kana , presence: true , format: { with:/\A[ァ-ヴー]+\z/u ,message: '全角カタカナを使用してください'}
  validates :first_name_kana  , presence: true , format: { with:/\A[ァ-ヴー]+\z/u ,message: '全角カタカナを使用してください'}
  validates :birthday         , presence: true

end
