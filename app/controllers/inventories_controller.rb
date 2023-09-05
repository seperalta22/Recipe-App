class InventoriesController < ApplicationController
  # load_and_authorize_resource

  def index
    @inventories = Inventory.all
  end

  def show; end

  def create; end

  def new; end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_back_or_to root_path
  end
end
