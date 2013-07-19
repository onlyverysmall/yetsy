class CartsController < ApplicationController

  def show
    @cart_item_ids = session[:cart] || []
    
    if @cart_item_ids
      @cart_items = @cart_item_ids.map { |id| Item.find(id) }.sort
      @price = calculate_price(@cart_item_ids)
    end
    
  end

  def create
    @item_id = params[:cart][:item_id]
    
    session[:cart] ||= []
    session[:cart] << @item_id

    redirect_to cart_url
  end

  def destroy
    @item_id = params[:cart][:item_id]

    session[:cart] ||= []
    session[:cart].delete(@item_id)

    redirect_to cart_url
  end
end
