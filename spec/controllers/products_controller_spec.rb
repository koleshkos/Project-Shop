# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
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

  describe '#show' do
    product = FactoryBot.create(:product)

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

  describe '#edit' do
    product = FactoryBot.create(:product)

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

  describe '#new' do
    product = FactoryBot.create(:product)

    it 'returns a success response' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(product).to render_template(:new)
    end

    it 'does not render a different template' do
      expect(product).to_not render_template('products/index')
    end
  end

  describe '#create' do
    bad_product = FactoryBot.build(:product, :invalid_params)
    product = FactoryBot.create(:product)

    it 'product be created' do
      post :create, params: { id: product, product: product.attributes }
      expect(product.save).to eq true
      expect(response).to be_redirect
    end

    it 'product not be created' do
      post :create, params: { id: product, product: bad_product.attributes }
      expect(bad_product.save).to_not eq true
      expect(response).not_to be_redirect
    end
  end

  describe '#update' do
    bad_product = FactoryBot.build(:product, :invalid_params)
    product = FactoryBot.create(:product)

    it 'product be updated' do
      patch :update, params: { id: product, product: product.attributes }
      expect(product.save).to eq true
      expect(response).to be_redirect
    end

    it 'product not be updated' do
      patch :update, params: { id: product, product: bad_product.attributes }
      expect(bad_product.save).to_not eq true
      expect(response).not_to be_redirect
    end
  end

  describe '#destroy' do
    product = FactoryBot.create(:product)
    count_deleted_products = Product.where(status: 'deleted').count

    it 'return status deleted for some product' do
      products = create_list(:product, 5)

      delete :destroy, params: { product_ids: products }, xhr: true

      products.each do |p|
        expect(Product.find(p.id).status).to eq('deleted')
      end

      expect(Product.where(status: 'deleted').count).to eq(count_deleted_products + products.length)
    end

    it 'return status deleted' do
      delete :destroy, params: { id: product }
      expect(Product.find(product.id).status).to eq('deleted')
    end

    it 'return correct count active products' do
      get :destroy, params: { id: product }
      expect(Product.where(status: 'deleted').count).to eq(count_deleted_products + 1)
    end
  end

  describe '#restore' do
    product = FactoryBot.create(:product)
    count_active_products = Product.where(status: 'active').count

    it 'return status active' do
      get :restore, params: { id: product }
      expect(Product.find(product.id).status).to eq('active')
    end

    it 'return correct count active products' do
      get :restore, params: { id: product }
      expect(Product.where(status: 'active').count).to eq(count_active_products + 1)
    end
  end
end
