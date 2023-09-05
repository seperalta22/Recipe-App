require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /public_index' do
    it 'returns http success' do
      get '/recipes/public_index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/recipes/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/recipes/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/recipes/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /delete' do
    it 'returns http success' do
      get '/recipes/delete'
      expect(response).to have_http_status(:success)
    end
  end
end
