class RootController < ApplicationController
  def index
    @items = Item.available
    @categories = Category.all
    @user = current_user
  end
end
