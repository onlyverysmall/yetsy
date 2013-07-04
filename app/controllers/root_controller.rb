class RootController < ApplicationController
  def index
    # will eventually need to paginate this
    @items = Item.all
    p "HEY YOUR ITEMS"
    p @items
    @categories = Category.all
    @favorited_items = current_user.favorited_items
  end
end
