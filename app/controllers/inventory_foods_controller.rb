class InventoryFoodsController < ApplicationController
  def new
    @inventory_id = params[:inventory_id]
    @foods = Food.all
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory_food = InventoryFood.new(post_params)
    if @inventory_food.save
      redirect_to inventory_path(id: @inventory_food.inventory_id), notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_back_or_to root_path
  end

  private

  def post_params
    params.require(:inventory_food).permit(:food_id, :inventory_id, :quantity)
  end
end
