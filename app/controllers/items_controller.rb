class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render 'new'
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :product_state_id, :shipping_charges_id, :shipping_address_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
