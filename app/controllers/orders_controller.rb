class OrdersController < ApplicationController
  def index
    # find shop id from params
    # show orders for that shop
    # maybe later add a status column and use scopes to give only shipped/unshipped
    @shop = Shop.find(params[:shop_id])

    if user_authorized?(@shop.owner)
      @orders = @shop.orders
    else
      redirect_to root_url
    end

  end

  def create
    # this is crazy wonkiness and needs refactoring
    @cart_item_ids = session[:cart]
    @shop_ids = @cart_item_ids.map { |id| Item.find(id).shop_id }.uniq

    @shop_ids.each do |shop_id|
      order = Order.new(buyer_id: current_user.id, shop_id: shop_id)

      if order.save!
        set_item_order_ids!(order.id, shop_id, @cart_item_ids)
        session[:cart] = nil
      else
        flash.now[:errors] ||= []
        flash.now[:errors] << shop.errors.full_messages
        redirect_to cart_url
        return
      end
    end
    
    redirect_to user_url(current_user)
  end
end
