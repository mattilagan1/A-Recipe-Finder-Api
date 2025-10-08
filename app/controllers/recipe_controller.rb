class RecipeController < ApplicationController
  def index
    recipes = Recipe.all

    render json: recipes
  end

  def create
    recipe = Recipe.new(
      name: params[:name],
      ingredients: params[:ingredients],
      instructions: params[:instructions],
      costs: params[:costs]
    )

    if recipe.save
      render json: { message: 'Recipe was successfully Created...' }, status: :created
    else
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
