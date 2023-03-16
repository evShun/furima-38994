class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    binding.pry
    @order = Order.new(set_params)
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


