require 'rails_helper'

RSpec.describe 'Admin', type: :request do 
  describe 'GET /admin' do
    it 'return success http status' do
      get '/admin'
      expect(response).to have_http_status(:success)
    end
  end
end