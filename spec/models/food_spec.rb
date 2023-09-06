require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    before(:each) do
      @food = Food.new(name: 'Banana', measurement_unit: "units", price: 1.2)
      @food.save
    end

    it 'name should be present' do
      expect(@food).to be_valid
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'measurement_unit should be present' do
      expect(@food).to be_valid
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'price should be present' do
      expect(@food).to be_valid
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'price must be integer or decimal greater or equal to zero' do
      expect(@food).to be_valid
      @food.price = -2
      expect(@food).to_not be_valid
      @food.price = 3
      expect(@food).to be_valid
    end

    it 'name must be less or equal than 20 characters' do
      expect(@food).to be_valid
      @food.name = 'a' * 21
      expect(@food).to_not be_valid
      @food.name = 'a' * 20
      expect(@food).to be_valid
    end

    it 'measurement_unit must be less or equal than 20 characters' do
      expect(@food).to be_valid
      @food.measurement_unit = 'a' * 21
      expect(@food).to_not be_valid
      @food.measurement_unit = 'a' * 20
      expect(@food).to be_valid
    end
  end

  
end
