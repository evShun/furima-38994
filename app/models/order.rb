class Order
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:number,:building,:phone_number,:user_id,:item_id,:token

  with_options presence: true do
   validates :postal_code   ,format: { with:/\A[0-9]{3}-[0-9]{4}\z/ ,message: '000-0000の形式に変更してください'}
   validates :prefecture_id ,numericality: { other_than: 0, message: "can't be blank" }
   validates :city
   validates :number
   validates :phone_number  ,format: { with: /\A[0-9]+\z/ message: '半角で入力してください'} ,length:{ minimum: 10, maximum: 11 }
   validates :token
   validates :user_id
   validates :item_id
  end


  def save
  purchase = Purchase.create(user_id: user_id,item_id: item_id)
  Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,number: number,building: building,phone_number: phone_number,purchase_id: purchase.id)
  end

end