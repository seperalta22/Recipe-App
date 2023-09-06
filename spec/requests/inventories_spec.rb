require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  describe FoodsController do
    before(:each) do
      @food = Food.create(name: 'Banana', measurement_unit: 'units', price: 1.2)
      @user = User.create(name: 'Tomas')
      @inventory = Inventory.create(user: @user, name: 'This is Inventory 1')
    end

    describe 'GET #index' do
      before do
        get inventories_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Inventories Index')
      end
    end

    describe 'GET #new' do
      before do
        get new_inventory_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Create a New Inventory')
      end
    end

    describe 'GET #show' do
      before do
        get inventory_path(@inventory)
      end

      it 'renders a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Add new Food to Inventory')
      end
    end
  end
end
