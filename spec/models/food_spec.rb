require 'rails_helper'

RSpec.describe Food, type: :model do
  it "has many inventory_foods" do
    association = Food.reflect_on_association(:inventory_foods)
    expect(association.macro).to eq(:has_many)
  end

  it "has many recipe_foods" do
    association = Food.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq(:has_many)
  end
end