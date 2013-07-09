class OrdersController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])

    if user_authorized?(@shop.owner)
      @orders = @shop.orders.uniq
    else
      redirect_to root_url
    end

  end

  def create
    @cart_item_ids = session[:cart]
    @shop_ids = get_shop_ids(@cart_item_ids)

    if create_orders_for_shops(@shop_ids, @cart_item_ids)
      redirect_to user_purchases_url(current_user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Something went horribly wrong. I don't know what. It could be anything, really. Do you know where your towel is?"
      redirect_to cart_url
    end  
  end

  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(params[:order])

    if @order.save
      redirect_to shop_orders_url(@order.shop)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @order.errors.full_messages
      redirect_to shop_orders_url(@order.shop)
    end
  end
end
