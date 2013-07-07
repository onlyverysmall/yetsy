module CartsHelper
  def calculate_price(item_ids)
    item_ids.map { |id| Item.find(id).price.to_f }.inject(:+)
  end

end
