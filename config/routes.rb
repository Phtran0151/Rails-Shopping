Rails.application.routes.draw do
  # Method of Order_Item and Orders_items
  post 'order_items' => "order_items#create"
  delete 'order_items/:id' => "order_items#destroy"
  get 'orders/:id' => "orders#show", as: "orders"
  # Method Routes of Checkouts
  resources :products, only: [:index]
  resources :checkout, only:[:index, :create]
  resources :shops, only:[:index, :show, :create]
  devise_for :users

  root "shops#index"
end

