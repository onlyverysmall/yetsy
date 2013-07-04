class RootController < ApplicationController
  def index
    # will eventually need to paginate this
    @items = Item.all
    @categories = Category.all
    if current_user
      @favorited_items = current_user.favorited_items 
    end
  end
end
