class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create_table
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id ,:status_id ,:charge_id ,:prefecture_id ,:shipping_id ,:price).merge(user_id: current_user.id)
  end

end
