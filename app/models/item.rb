class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping
  belongs_to :user
  has_one_attached :image

  validates :title	       , presence: true ,length: { maximum: 40 }
  validates :text          , presence: true
  validates :category_id   , presence: true ,numericality: { other_than: 0 ,message: "can't be blank"}
  validates :status_id     , presence: true ,numericality: { other_than: 0 ,message: "can't be blank"}
  validates :charge_id     , presence: true ,numericality: { other_than: 0 ,message: "can't be blank"}
  validates :prefecture_id , presence: true ,numericality: { other_than: 0 ,message: "can't be blank"}
  validates :shipping_id   , presence: true ,numericality: { other_than: 0 ,message: "can't be blank"}
  validates :price         , presence: true # { with:/\A[/d]+\z/ ,message: '半角を使用してください'} jconに書く？
  validates :image         , presence: true
  

end