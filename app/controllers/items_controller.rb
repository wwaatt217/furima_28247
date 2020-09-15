class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render 'show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :product_state_id, :shipping_charges_id, :shipping_address_id, :delivery_days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
