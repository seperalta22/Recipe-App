class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_index
    @recipes = Recipe.where(public: true) # Filter for public recipes
    @public_recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_foods.includes(:food)
  end

  def create
    current_user = User.first
    recipe = Recipe.new(name: params[:name], preparation_time: params[:preparation_time], cooking_time: params[:cooking_time], description: params[:description])

    recipe.public = params[:public] == '1'
    if current_user.recipes << recipe
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe could not be created'
      render 'new'
    end
  end

  def new; end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_foods.destroy_all
    @recipe.destroy
    redirect_to recipes_path
  end
end
