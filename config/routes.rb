Rails.application.routes.draw do
  root 'pages#home'
  
  scope :admin do
    resources :products
  end

end
