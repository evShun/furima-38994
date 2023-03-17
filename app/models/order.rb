class Order
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:number,:building,:phone_number,:user_id,:item_id,:token

  with_options presence: true do
   validates :postal_code   
   validates :prefecture_id 
   validates :city           
   validates :number         
   validates :phone_number   
   validates :token          
   validates :user_id       
   validates :item_id       
  end


  def save
  purchase = Purchase.create(user_id: user_id,item_id: item_id)
  Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,number: number,building: building,phone_number: phone_number,purchase_id: purchase.id)
  end

end