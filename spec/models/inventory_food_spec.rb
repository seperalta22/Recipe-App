require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'Tomas')
      @user.save
      @food = Food.new(name: 'Banana', measurement_unit: 'units', price: 1.2)
      @food.save
      @inventory = Inventory.new(user: @user, name: 'This is Inventory 1')
      @inventory.save
      @inventory_food = InventoryFood.new(food: @food, inventory: @inventory, quantity: 1)
      @inventory_food.save
    end

    it 'quantity should be present' do
      expect(@inventory_food).to be_valid
      @inventory_food.quantity = nil
      expect(@inventory_food).to_not be_valid
    end

    it 'inventory_id should be present' do
      expect(@inventory_food).to be_valid
      @inventory_food.inventory_id = nil
      expect(@inventory_food).to_not be_valid
    end

    it 'food_id should be present' do
      expect(@inventory_food).to be_valid
      @inventory_food.food_id = nil
      expect(@inventory_food).to_not be_valid
    end

    it 'quantity must be integer or decimal greater or equal to zero' do
      expect(@inventory_food).to be_valid
      @inventory_food.quantity = -2
      expect(@inventory_food).to_not be_valid
      @inventory_food.quantity = 3
      expect(@inventory_food).to be_valid
    end

    it 'belongs to an inventory' do
      association = InventoryFood.reflect_on_association(:inventory)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a food' do
      association = InventoryFood.reflect_on_association(:food)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
