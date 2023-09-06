require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'belongs to a user' do
    association = Recipe.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many recipe_foods' do
    association = Recipe.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq(:has_many)
  end
end