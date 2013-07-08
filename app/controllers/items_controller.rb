class ItemsController < ApplicationController
  def index
    @categories = Category.all
    @search = Item.search do
      fulltext params[:search]
    end
    if current_user
      @favorited_items = current_user.favorited_items
    end
    @items = @search.results
  end

  def new
    @item = current_user.shop.items.build
    @categories = Category.all
  end

  def create
    @item = current_user.shop.items.build(params[:item])
    @categories = Category.all
    
    if @item.save
      redirect_to shop_url(current_user.shop)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @item.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all

    if @item.purchased
      flash[:errors] ||= []
      flash[:errors] << "You cannot edit purchased items"
      redirect_to item_url(@item)
      return
    end

    if user_authorized?(@item.owner)
      render :edit
    else
      redirect_to root_url
    end

  end

  def update
    @categories = Category.all
    @item = Item.find(params[:id])
    @item.assign_attributes(params[:item])
        
    if @item.save
      render :show
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      redirect_to shop_url(current_user.shop)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @item.errors.full_messages.to_sentence
      redirect_to shop_url(current_user.shop)
    end
  end

end
