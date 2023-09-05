class FoodsController < ApplicationController

  def index
    @foods = Food.includes(:recipe_foods, :inventory_foods).all
  end
  
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    # @recipe = Recipe.find(params[:id])
    if @food.save
      redirect_to root_path, notice: 'Post was successfully created'
    else
      flash[:alert] = 'There was an error saving this post.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    return unless @food.destroy

    redirect_to recipes_path, notice: 'Post was successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
