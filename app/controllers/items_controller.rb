class ItemsController < ApplicationController
  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(params[:item])
    
    if @item.save

    else

    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes
        
    if @item.save
      
    else
      
    end
  end

  def destroy
    @item = Item.find(params[:id])
  end

end
