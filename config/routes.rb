Rails.application.routes.draw do
  resources :orders
  devise_for :users
  resources :shops, only:[:index, :show, :create]

  root "shops#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
