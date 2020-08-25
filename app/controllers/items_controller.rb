class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    
    
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: index
    else
      render "new"
    end
  end


  def seles

  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :product_state_id, :shipping_charges_id, :shipping_address_id, :delivery_days_id)
    .merge(user_id: current_user.id)
  end

end
