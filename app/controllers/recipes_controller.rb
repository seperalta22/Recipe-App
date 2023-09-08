class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_index
    @recipes = Recipe.where(public: true) # Filter for public recipes
    @public_recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @recipe_food = @recipe.recipe_foods.includes(:food)
    @inventories = Inventory.all
  end

  def create
    recipe = Recipe.new(name: params[:name], preparation_time: params[:preparation_time],
                        cooking_time: params[:cooking_time], description: params[:description])

    recipe.public = params[:public] == '1'
    if current_user.recipes << recipe
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe could not be created'
      render 'new'
    end
  end

  def new; end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    return unless @recipe.update(public: !@recipe.public)

    redirect_to recipe_path
  end

  def shopping_list
    @inventory_obj = Inventory.find(params[:selected_inventory_id])
    @recipe_obj = Recipe.includes(recipe_foods: :food).find(params[:recipe][:recipe_id])

    food_names_from_inventory = @inventory_obj.inventory_foods.map do |inventory_food|
      inventory_food.food.name.downcase
    end

    @missing_foods = []
    @recipe_obj.recipe_foods.each do |recipe_food|
      inventory_name = recipe_food.food.name.downcase
      if food_names_from_inventory.include?(inventory_name)
        inventory_food = @inventory_obj.inventory_foods.find { |ifood| ifood.food.name.downcase == inventory_name }
        if inventory_food.quantity < recipe_food.quantity

          @missing_foods << {
            food: inventory_food.food,
            quantity_needed: recipe_food.quantity - inventory_food.quantity
          }
        end
      else

        @missing_foods << {
          food: recipe_food.food,
          quantity_needed: recipe_food.quantity
        }
      end
    end

    @total_price = 0
    @missing_foods.each do |missing_food|
      price_multiply_with_qty = missing_food[:food].price * missing_food[:quantity_needed]
      @total_price += price_multiply_with_qty
    end

    @total_price
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_foods.destroy_all
    @recipe.destroy
    redirect_to recipes_path
  end
end
