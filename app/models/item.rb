class Item < ApplicationRecord

  validates :title	       , presence: true
  validates :text          , presence: true
  validates :category_id   , presence: true
  validates :status_id     , presence: true
  validates :charge_id     , presence: true
  validates :prefecture_id , presence: true
  validates :shipping_id   , presence: true
  validates :price         , presence: true
  validates :user          , presence: true
  # imageはどうする？
    
  belongs_to :users
  has_one_attached :image

end
