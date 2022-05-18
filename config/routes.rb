# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  root 'static_pages#home'

  scope '/admin' do
    get '/', to: 'static_pages#admin_home'
    patch '/products/:id/restore', to: 'products#restore', as: 'product_restore'
    delete '/products', to: 'products#destroy', as: 'delete_product'
    resources :products
  end

  resources :products, only: %i[show index]
end
