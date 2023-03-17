class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    unless user_signed_in? && current_user.id != @item.user.id
      redirect_to root_path
    end
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(set_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end
end

  private
  def set_params
    params.require(:order).permit(:postal_code,:prefecture_id,:city,:number,:building,:phone_number,:purchase,:item_id).merge(user_id: current_user.id, token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(amount: @item[:price], card: params[:token], currency: 'jpy')
  end


