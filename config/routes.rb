# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/admin', to: 'static_pages#admin_home'

  scope '/admin' do
    resources :products
  end

  resources :products, only: %i[show index]
end
