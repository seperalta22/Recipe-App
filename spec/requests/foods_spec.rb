require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe FoodsController do
    let(:food) { Food.new(name: 'Banana', measurement_unit: 'units', price: 1.2) }

    describe 'GET #index' do
      before do
        get foods_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Food Index')
      end
    end

    describe 'GET #new' do
      before do
        get new_food_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Add new Food')
      end
    end
  end
end
