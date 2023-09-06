module RecipesHelper
  def calculate_total_price(recipe)
    price = 0
    recipe.recipe_foods.each do |recipe_food|
      price_each_food_item = recipe_food.food.price * recipe_food.quantity
      price += price_each_food_item
    end
    price
  end
end
