class FavoritesController < ApplicationController
  respond_to :json, only: [:create, :destroy]

  def index
    @user = User.find_by_username(params[:user_id])
    
    if user_authorized?(@user)
      @favorited_items = @user.favorited_items
    else
      flash[:errors] ||= []
      flash[:errors] << "You aren't authorized to see that page."
      redirect_to root_url
    end
  end

  def create
    @favorite = current_user.favorites.build(params[:favorite])

    if @favorite.save
      render json: @favorite
    else
      render json: { error: "unable to favorite item" }, status: 422
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by_item_id(params[:id])
    
    if @favorite.destroy
      redirect_to :back
    else
      render json: { error: "unable to unfavorite item" }, status: 422
    end
  end
end
