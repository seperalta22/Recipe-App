class InventoriesController < ApplicationController
  # load_and_authorize_resource

  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = InventoryFood.where(inventory: @inventory)
  end

  def create
    @inventory = current_user.inventories.new(inventory_params)
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def new
    @inventory = current_user.inventories.build
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.inventory_foods.destroy_all
    @inventory.destroy
    redirect_back_or_to root_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
