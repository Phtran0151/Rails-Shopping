Rails.application.routes.draw do
  # Method of Order_Item or Cart_items
  post 'order_items' => "order_items#create"
  get 'order_items/:id' => "order_items#show", as: "order_item"
  delete 'order_items/:id' => "order_items#destroy"

  post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"

  resources :products
  resources :payment
  resources :shops, only:[:index, :show, :create]
  devise_for :users

  root "shops#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
