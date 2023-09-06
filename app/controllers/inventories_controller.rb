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
    @inventory = User.first.inventories.new(post_params) # current_user
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def new
    @inventory = User.first.inventories.build # current_user
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_back_or_to root_path
  end

  private

  def post_params
    params.require(:inventory).permit(:name)
  end

end
