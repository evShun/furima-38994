class Item < ApplicationRecord

  validates :title	       , presence: true ,length: { maximum: 40 }
  validates :text          , presence: true
  validates :category_id   , presence: true
  validates :status_id     , presence: true
  validates :charge_id     , presence: true
  validates :prefecture_id , presence: true
  validates :shipping_id   , presence: true
  validates :price         , presence: true # { with:/\A[/d]+\z/ ,message: '半角を使用してください'} jconに書く？
  validates :user          , presence: true
  # imageはどうする？
    
  belongs_to :users
  has_one_attached :image

end
