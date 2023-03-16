class Order
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:number,:building,:phone_number,:purchase,:user_id,:item_id,:token

  validates :postal_code   , presence: true
  validates :prefecture_id , presence: true
  validates :city          , presence: true
  validates :number        , presence: true
  validates :phone_number  , presence: true
  validates :token         , presence: true


  def save
  Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,number: number,building: building,phone_number: phone_number,purchase: purchase)
  Purchase.create(user_id: user_id,item_id: item_id)
  end

end