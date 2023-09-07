require 'rails_helper'

RSpec.describe 'Inventories', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.new(name: 'Tom', email: 'a@aa.com', password: '123456')
      @user.save
      @food = Food.new(name: 'Banana', measurement_unit: 'units', price: 1.2)
      @food.save
      @inventory1 = Inventory.new(user: @user, name: 'This is Inventory 1')
      @inventory1.save
      @inventory2 = Inventory.new(user: @user, name: 'This is Inventory 2')
      @inventory2.save
    end


    before do
      visit inventories_path
    end

    it 'shows the right page' do
      expect(page).to have_content('Inventories Index')
    end

    it 'shows an inventory name' do
      expect(page).to have_content('This is Inventory 1')
    end

    describe 'redirects to each inventory when clicked' do
      it 'to inventory 1 when clicking on its name' do
        click_link @inventory1.name
        expect(page).to have_current_path(inventory_path(@inventory1))
      end
      it 'to inventory 2 when clicking on its name' do
        click_link @inventory2.name
        expect(page).to have_current_path(inventory_path(@inventory2))
      end
    end
  end
end
