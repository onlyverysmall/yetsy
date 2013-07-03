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
    @items = @shop.items
    @categories = Category.all

    if user_authorized?(current_user)
      render :edit
    else
      redirect_to root_url
    end
  end

  def update
    @shop = Shop.find(params[:id])
    @items = @shop.items
    @categories = Category.all

    @shop.assign_attributes(params[:shop])

    if @shop.save
      render :show
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @shop.errors.full_messages.to_sentence
      render :edit
    end
  end
end
