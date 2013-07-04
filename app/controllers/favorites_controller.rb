class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if user_authorized?(@user)
      @favorited_items = current_user.favorited_items
    else
      redirect_to root_url
    end
  end

  def create
    @favorite = current_user.favorites.build(params[:favorite])

    if @favorite.save
      redirect_to root_url
    else
      render json: { error: "unable to favorite item" }, status: 422
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    
    if @favorite.destroy
      redirect_to root_url
    else
      render json: { error: "unable to unfavorite item" }, status: 422
    end
  end
end
