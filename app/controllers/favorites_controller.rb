class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
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
    @favorite = Favorite.find(params[:favorite])
    @favorite.destroy

    render json: @favorite
  end
end
