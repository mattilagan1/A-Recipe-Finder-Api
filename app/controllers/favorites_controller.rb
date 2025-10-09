class FavoritesController < ApplicationController
#  before_action :authenticate
  def index
    favorites = Favorite.all

    render json: favorites
  end

  def create 
    favorite = Favorite.new(
      user_id: params[:user_id],
      recipe_id: params[:recipe_id]
    )

    if favorite.save
      render json: { message: 'Users recipe was saved to favorites' }, status: :created
    else
      render json: { errors: favorite.error.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])

    favorite.destroy

    render json: { message: "Removed from favorites..." } 
  end
end
