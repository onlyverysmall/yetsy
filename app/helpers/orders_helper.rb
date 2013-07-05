module OrdersHelper
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
end
