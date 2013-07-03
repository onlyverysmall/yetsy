class RootController < ApplicationController
  def index
    # will eventually need to paginate this
    @items = Item.all.sort
    @categories = Category.all
  end
end
