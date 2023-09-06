require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  it 'belongs to an inventory' do
    association = InventoryFood.reflect_on_association(:inventory)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    association = InventoryFood.reflect_on_association(:food)
    expect(association.macro).to eq(:belongs_to)
  end
end
