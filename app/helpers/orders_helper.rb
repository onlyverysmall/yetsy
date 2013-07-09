module OrdersHelper
  def get_shop_ids(cart_item_ids)
    cart_item_ids.map { |id| Item.find(id).shop_id }.uniq
  end

  def create_orders_for_shops(shop_ids, cart_item_ids)
    shop_ids.each do |shop_id|
      order = Order.new(buyer_id: current_user.id, shop_id: shop_id)

      if order.save!
        set_item_order_ids!(order.id, shop_id, cart_item_ids)
      else
        flash.now[:errors] ||= []
        flash.now[:errors] << shop.errors.full_messages
        redirect_to cart_url
        return
      end

      session[:cart] = nil
    end
  end
  
  def set_item_order_ids!(order_id, shop_id, cart_item_ids)
    items = cart_item_ids.map do |id|
      Item.find(id) if Item.find(id).shop_id == shop_id
    end 

    if items
      items.each do |item|
        next if item.nil?
        item.order_id = order_id
        item.purchased = true
        item.save!
      end
    end
  end

  def order_total(order)
    order.items.map { |item| item.price }.inject(:+)
  end
end
