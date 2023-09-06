class RecipeFoodsController < ApplicationController
  def new
    @recipe_id = params[:recipe_id]
    @foods = Food.all
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(id: @recipe_food.recipe_id), notice: 'Food was successfully created.'
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
