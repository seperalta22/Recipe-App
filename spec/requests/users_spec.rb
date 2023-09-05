require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /public_index' do
    it 'returns http success' do
      get '/users/public_index'
      expect(response).to have_http_status(:success)
    end
  end
end
