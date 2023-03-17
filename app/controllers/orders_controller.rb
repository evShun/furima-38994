class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(set_params)
    pay_item
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end
end

  private
  def set_params
    params.permit(:postal_code,:prefecture_id,:city,:number,:building,:phone_number,:purchase,:item_id).merge(user_id: current_user.id, token: params[:token] )
  end

  def pay_item
    Payjp.api_key = "sk_test_d639f41d2479e708eb5d83e0"  
    Payjp::Charge.create(amount: @item[:price], card: params[:token], currency: 'jpy')
  end


