# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'

  scope '/admin' do
    get '/', to: 'static_pages#admin_home'
    patch '/products/:id/restore', to: 'products#restore', as: 'product_restore'
    delete '/products', to: 'products#destroy', as: 'delete_product'
    resources :products
  end

  resources :products, only: %i[show index]
end
