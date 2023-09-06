require 'rails_helper'

RSpec.describe Inventory, type: :model do
  it 'belongs to a user' do
    association = Inventory.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many inventory_foods' do
    association = Inventory.reflect_on_association(:inventory_foods)
    expect(association.macro).to eq(:has_many)
  end
end
