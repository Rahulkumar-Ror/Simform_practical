Rails.application.routes.draw do
  get 'products/index'
  get 'products/edit'
  get 'products/show'
  get 'products/new'
  get 'customers/index'
  get 'customers/new'
  get 'customers/edit'
  resources :products
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :buisness do 
    resources :customers
  end  
end
