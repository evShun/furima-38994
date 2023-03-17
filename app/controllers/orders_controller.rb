class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sale_check1
  before_action :sale_check2

  def index
    @order = Order.new
  end
  
  def create
    @order = Order.new(set_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sale_check1
    unless @item.purchase.blank?  
      redirect_to root_path
    end
  end

  def sale_check2
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def set_params
    params.require(:order).permit(:postal_code,:prefecture_id,:city,:number,:building,:phone_number,:purchase,).merge(user_id: current_user.id, item_id: @item.id,token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(amount: @item[:price], card: params[:token], currency: 'jpy')
  end
end
