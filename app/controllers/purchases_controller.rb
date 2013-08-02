class PurchasesController < ApplicationController
  def index
    @user = current_user
    @purchases = Order.where(buyer_id: @user.id).all
  end
end
