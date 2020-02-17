Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :products
  devise_for :users
  resources :shops, only:[:index, :show, :create]

  root "shops#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
