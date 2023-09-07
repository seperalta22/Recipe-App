require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { User.create(name: 'Test User', email: 'user@email.com', password: 'password') }
  let!(:recipe) { Recipe.create(id: 1, name: 'Test Post', preparation_time: 30, cooking_time: 60, description: 'lots of ingredients', public: true, user_id: user.id) }

  describe 'GET /index' do
    it 'returns http success' do
      get "/recipes/#{recipe.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/recipes/#{recipe.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get "/recipes/#{recipe.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/recipes/new'
      expect(response).to have_http_status(:success)
    end
  end
end
