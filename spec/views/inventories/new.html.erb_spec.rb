require 'rails_helper'

RSpec.describe 'inventories/new.html.erb', type: :view do
  before do
    assign(:inventory, Inventory.new)
    render
  end

  it 'displays the Create Inventory form' do
    expect(rendered).to have_selector('h1', text: 'Create a New Inventory')

    expect(rendered).to have_selector('form[action="/inventories"][method="post"]') do
      expect(rendered).to have_selector('input[type="text"][id="inventory_name"]')

      expect(rendered).to have_selector('input[type="submit"][value="Create Inventory"]')
    end
  end
end
