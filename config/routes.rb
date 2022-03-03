Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/new'
  # get 'orders/show'
  # get 'orders/edit'
  # resources :orders, only: [:show, :index, :new, :create,:destroy, :edit, :update] 
  # delete 'delete_customer', to: 'orders#destroy', as: 'order_destroy'
  get 'show_orders/:id', to: 'orders#showorder', as: 'show_orders'
  root "products#index"
  
  resources :products do
    resources :orders, shallow: true
  end
  resources :products
  # resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :buisness do 
    resources :customers, only: [:index, :new, :create, :edit, :update] do
      member do
        get 'preview'
        match 'delete_customer', via: [:delete]
      end
        collection do
        get 'search'
      end  
    end
  end
end
