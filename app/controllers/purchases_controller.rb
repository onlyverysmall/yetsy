class PurchasesController < ApplicationController
  def index
    @user = current_user
    @purchases = Order.where(buyer_id: current_user.id)
  end
end
