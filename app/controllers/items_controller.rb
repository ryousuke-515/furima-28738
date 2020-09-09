class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new  
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_charges_id, :area_id, :shipping_days_id, :price, :image, :description, :name,).merge(user_id: current_user.id)
  end
  
end
