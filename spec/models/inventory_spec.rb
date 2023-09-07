require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'Tomas', email: 'a@a.com', password: '123456')
      @user.save
      @inventory = Inventory.new(user: @user, name: 'This is Inventory 1')
      @inventory.save
    end

    it 'name should be present' do
      expect(@inventory).to be_valid
      @inventory.name = nil
      expect(@inventory).to_not be_valid
    end

    it 'uder_id should be present' do
      expect(@inventory).to be_valid
      @inventory.user_id = nil
      expect(@inventory).to_not be_valid
    end

    it 'name must be less or equal than 20 characters' do
      expect(@inventory).to be_valid
      @inventory.name = 'a' * 21
      expect(@inventory).to_not be_valid
      @inventory.name = 'a' * 20
      expect(@inventory).to be_valid
    end
    it 'belongs to a user' do
      association = Inventory.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many inventory_foods' do
      association = Inventory.reflect_on_association(:inventory_foods)
      expect(association.macro).to eq(:has_many)
    end
  end
end
