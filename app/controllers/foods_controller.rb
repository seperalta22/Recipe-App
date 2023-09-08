class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def create
    @food = Food.new(post_params)
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_back_or_to root_path
  end

  def new
    @food = Food.new
  end

  private

  def post_params
    params.require(:food).permit(:measurement_unit, :name, :price)
  end
end
