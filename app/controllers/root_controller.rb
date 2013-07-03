class RootController < ApplicationController
  def index
    # will eventually need to paginate this
    @items = Item.all.sort
    @categories = Category.all
    @favorited_items = current_user.favorited_items
  end
end
