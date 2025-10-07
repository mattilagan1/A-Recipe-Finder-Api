class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all

    render json: @recipes
  end

  def show
    render json: @recipe
  end

  def create
    @recipe = Recipe.new(
      name: params[:name],
      ingredients: params[:ingredients],
      instructions: params[:instructions],
      costs: params[:costs]
    )

    if @recipe.save
      render json: { message: 'Recipe was successfully Created...' }, status: :created
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @recipe.update(
      name: params[:name] || @recipe.name,
      ingredients: params[:ingredients] || @recipe.ingredients,
      instructions: params[:instructions] || @recipe.instructions,
      costs: params[:costs] || @recipe.costs
    )
    
    render json: @recipe
  end

  def destroy
    @recipe.destroy

    render json: { message: "Recipe deleted..." }
  end

  private

  def send_email
    puts "------------"
    puts "Mimicing sending an email confirmation"
    puts "------------"
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
