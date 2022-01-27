# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /' do
    it 'return success http status' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /admin' do
    it 'return success http status' do
      get '/admin'
      expect(response).to have_http_status(:success)
    end

    it 'returns text' do
      get '/admin'
      expect(response.body.include?('ADMIN')).to eq(true)
    end
  end
end
