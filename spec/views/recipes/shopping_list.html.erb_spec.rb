require 'rails_helper'

RSpec.describe 'recipes/shopping_list.html.erb', type: :view do
  before do
    missing_foods = [
      { food: Struct.new(:name, :price).new('Food Item', 10), quantity_needed: 5 }
    ]
    assign(:missing_foods, missing_foods)
    assign(:recipe_obj, Struct.new(:name).new('Recipe Name'))
    assign(:total_price, 50)
    assign(:inventory_obj, Struct.new(:name).new('Inventory Name'))
    render
  end

  it 'displays the shopping list' do
    expect(rendered).to have_selector('h1', text: 'Shopping List')

    expect(rendered).to have_selector('h5', text: 'Amount of food to buy:')
    expect(rendered).to have_selector('h5', text: 'Recipe: Recipe Name')
    expect(rendered).to have_selector('h5', text: 'Total value of food needed: $50')
    expect(rendered).to have_selector('h5', text: 'Inventory: Inventory Name')

    expect(rendered).to have_selector('thead th', text: 'Serial#')
    expect(rendered).to have_selector('thead th', text: 'Food')
    expect(rendered).to have_selector('thead th', text: 'Quantity')
    expect(rendered).to have_selector('thead th', text: 'Price')

    expect(rendered).to have_selector('tbody tr', count: 1)
    expect(rendered).to have_selector('tbody td', text: '1')
    expect(rendered).to have_selector('tbody td', text: 'Food Item')
    expect(rendered).to have_selector('tbody td', text: '5')
    expect(rendered).to have_selector('tbody td', text: '$50')
  end
end
