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

  describe 'Pagination' do
    it 'returns first page if -1 is requested' do
      get '/admin/products?page=-1'
      res = response.body
      get '/admin/products?page=1'
      expect(response.body).to eq(res)
    end

    it 'returns last page if more than max is requested' do
      get "/admin/products?page=#{(Product.count.to_f / ApplicationController::PER_PAGE).ceil}"
      res = response.body
      get "/admin/products?page=#{(Product.count.to_f / ApplicationController::PER_PAGE).ceil + 1}"
      expect(response.body).to eq(res)
    end
  end
end
