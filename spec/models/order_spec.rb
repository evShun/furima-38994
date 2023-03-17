require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

describe '商品購入' do
  context '商品購入できるとき' do
    it '空欄を埋めると購入できる' do
      expect(@order).to be_valid
    end
    it 'buildingのみ空欄でも購入できる' do
      @order.building = ''
      expect(@order).to be_valid
    end
  end


  context '購入できないとき' do
    it 'postal_codeが空では購入できない' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeに-が含まれていないと購入できない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code 000-0000の形式に変更してください")
    end

    it 'prefecture_idが空では購入できない' do
      @order.prefecture_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが0では購入できない' do
      @order.prefecture_id = '0'
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では購入できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'numberが空では購入できない' do
      @order.number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Number can't be blank")
    end

    it 'phone_numberが空では購入できない' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが9桁以下では購入できない' do
      @order.phone_number = '123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end
    it 'phone_numberが12桁以上では購入できない' do
      @order.phone_number = '123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'phone_numberが全角では購入できない' do
      @order.phone_number = '０１２３４５６７８９'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number 半角で入力してください")
    end

    it 'tokenが空では購入できない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it '商品が紐付いていなければ投稿できない' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end
end

end