class OrdersController < ApplicationController
  def index
    # redirect
    # formobject 
    @item = Item.find(params[:item_id])
    @order = ItemPurchaseAddress.new
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @order = ItemPurchaseAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private
 

  def order_params
    params.permit(:post_code, :item_purchase_id, :city, :area_id, :address, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  # payjp
end
