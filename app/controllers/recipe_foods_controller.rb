class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.where(id: params[:food_id]).first
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_food][:recipe_id])
    @food = Food.find(params[:recipe_food][:food_id])
    @recipe_food = RecipeFood.create(
      recipe: @recipe,
      food: @food,
      quantity: params[:recipe_food][:quantity]
    )
    if @recipe_food.save
      redirect_to root_path
    else
      render :new, alert: 'Failed to create recipe'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    return unless @recipe_food.destroy

    redirect_to recipes_path, notice: 'Post was successfully deleted.'
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
