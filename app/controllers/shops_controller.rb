class ShopsController < ApplicationController
  before_filter :redirect_shop_owner, only: [:new]

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.build_shop(params[:shop])

    if @shop.save
      render :show
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.assign_attributes(params[:shop])

    if @shop.save
      render json: @shop
    else
      # error
    end
  end
end
