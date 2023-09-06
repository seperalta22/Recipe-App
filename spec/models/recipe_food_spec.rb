require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "belongs to a recipe" do
    association = RecipeFood.reflect_on_association(:recipe)
    expect(association.macro).to eq(:belongs_to)
  end

  it "belongs to a food" do
    association = RecipeFood.reflect_on_association(:food)
    expect(association.macro).to eq(:belongs_to)
  end
end