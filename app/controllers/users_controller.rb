class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @items = Item.includes(:user).order('created_at DESC')
  end

end
