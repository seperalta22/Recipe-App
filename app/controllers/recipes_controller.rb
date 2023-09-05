class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_index
    @recipes = Recipe.where(public: true) # Filter for public recipes
    @public_recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def show; end

  def create; end

  def new; end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
