require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'Tomas')
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

  end

  
end
