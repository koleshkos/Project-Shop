# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  get 'carts/:id', to: 'carts#show', as: 'cart'
  delete 'carts/:id', to: 'carts#destroy'

  post 'line_items/:id/add', to: 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce', to: 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items', to: 'line_items#create'
  get 'line_items/:id', to: 'line_items#show', as: 'line_item'
  delete 'line_items/:id', to: 'line_items#destroy'

  scope '/admin' do
    get '/', to: 'static_pages#admin_home'
    patch '/products/:id/restore', to: 'products#restore', as: 'product_restore'
    delete '/products', to: 'products#destroy', as: 'delete_product'
    resources :products
  end

  resources :products, only: %i[show index]
end
