# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { Product.create(name: 'Product', image: 'product.jpg', code: '12345RE', price: 1000, description: 'My Product') }

  describe 'GET index' do
    subject(:index) { get :index }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(index).to render_template(:index)
    end

    it 'does not render a different template' do
      expect(index).to_not render_template('products/show')
    end
  end

  describe 'GET show' do
    it 'returns a success response' do
      get :show, params: { id: product }
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show, params: { id: product }
      expect(product).to render_template(:show)
    end

    it 'does not render a different template' do
      expect(product).to_not render_template('products/index')
    end
  end

  describe 'GET edit' do
    it 'returns a success response' do
      get :edit, params: { id: product }
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, params: { id: product }
      expect(product).to render_template(:edit)
    end

    it 'does not render a different template' do
      expect(product).to_not render_template('products/index')
    end
  end

  describe 'GET new' do
    it 'returns a success response' do
      get :new, params: { id: product }
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new, params: { id: product }
      expect(product).to render_template(:new)
    end

    it 'does not render a different template' do
      expect(product).to_not render_template('products/index')
    end
  end

  describe 'POST create' do
    let(:product) { Product.new }

    it 'returns a success response' do
      post :create, params: { id: product, product: { name: 'Product', image: 'product.jpg', code: '12345RE', price: 1000, description: 'My Product' } }
      expect(response).to be_redirect
    end

    it 'with bad data' do
      post :create, params: { id: product, product: { name: 'Product', image: 'product.jpg', code: 1000, price: '12345RE', description: 'My Product' } }
      expect(response).not_to be_redirect
    end
  end

  describe 'PATCH update' do
    it 'updates the product and redirects' do
      patch :update, params: { id: product, product: { name: 'Product', image: 'product.jpg', code: '12345RE', price: 1000, description: 'My Product' } }
      expect(response).to be_redirect
    end

    it 'with bad data' do
      patch :update, params: { id: product, product: { name: 'Product', image: 'product.jpg', code: 1000, price: '12345RE', description: 'My Product' } }
      expect(response).not_to be_redirect
    end
  end

  describe 'DELETE destroy' do
    it 'return error' do
      delete :destroy, params: { id: product }
      expect { product.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
