Rails.application.routes.draw do
  root to: 'categories#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :categories, path: 'categoria', only: [:index, :show], param: :alias
  resources :products, path: 'produto', only: [:index, :show], param: :alias
  resources :comments

  resources :carts, only: [:index] do
    collection do 
      post '/cart/:product_id', to: 'carts#create', as: :create
    end
  end

  resources :orders, only: [:index, :create, :show, :delete]

  # resources :profile, 
  get 'myprofile', to: 'profile#show'
end
