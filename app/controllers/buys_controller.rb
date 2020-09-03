class BuysController < ApplicationController
  before_action :move_to_index
  before_action :set_item, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
  end

  def new
    @buy = Buy.new
  end

  def create
    @buy_address = BuyAddress.new(buy_address_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_address_params
    params.permit(:token, :item_id, :postal_code, :prefecture, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_address_params[:token],
      currency: 'jpy'
    )
  end
end
