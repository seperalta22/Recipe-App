class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
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
