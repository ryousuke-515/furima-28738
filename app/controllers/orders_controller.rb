class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order = ItemPurchaseAddress.new
    redirect_to root_path if @item.user_id == current_user.id
  end

  def create
    @order = ItemPurchaseAddress.new(order_params)

    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:post_code, :item_purchase_id, :city, :area_id, :address, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # payjp
end
