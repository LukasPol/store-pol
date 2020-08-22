Rails.application.routes.draw do
  resources :comments
  root to: 'categories#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :categories, path: 'categoria', only: [:index, :show], param: :alias
  resources :products, path: 'produto', only: [:index, :show], param: :alias

  # resources :profile, 
  get 'myprofile', to: 'profile#show'
end
