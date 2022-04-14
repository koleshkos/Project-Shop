# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/admin', to: 'static_pages#admin_home'
  get '/admin/products/:id/restore', to: 'products#restore', as: 'product_restore'
  delete '/admin/products', to: 'products#destroy', as: 'delete_product'

  scope '/admin' do
    resources :products
  end

  resources :products, only: %i[show index]
end
