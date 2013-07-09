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
    @shop = Shop.find_by_name(params[:id])
    @items = @shop.items.available
    @favorited_items = current_user.favorited_items if current_user
  end

  def edit
    @shop = Shop.find_by_name(params[:id])
    @items = @shop.items.available
    @categories = Category.all

    if user_authorized?(@shop.owner)
      render :edit
    else
      redirect_to root_url
    end
  end

  def update
    @shop = Shop.find_by_name(params[:id])
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
