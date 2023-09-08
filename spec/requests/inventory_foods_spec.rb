require 'rails_helper'

RSpec.describe 'InventoryFoods', type: :request do
  describe InventoryFoodsController do
    before(:each) do
      @food = Food.create(name: 'Banana', measurement_unit: 'units', price: 1.2)
      @user = User.create(name: 'Tomas')
      @inventory = Inventory.create(user: @user, name: 'This is Inventory 1')
      @inventory_food = InventoryFood.create(inventory: @inventory, food: @food, quantity: 10)
    end

    describe 'GET #new' do
      before do
        get new_inventory_food_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Add new Food to Inventory')
      end
    end
  end
end
