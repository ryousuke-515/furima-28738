class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :show, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
    @item_purchase = ItemPurchase.all
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  # def destroy
  #   if item = Item.find(params[:id])
  #     item.destroy
  #     redirect_to root_path
  #   else
  #     render :show
  #   end
  # end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_charges_id, :area_id, :shipping_days_id, :price, :image, :description, :name).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
