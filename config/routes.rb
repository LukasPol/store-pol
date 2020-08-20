Rails.application.routes.draw do
  root to: 'products#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :categories, path: 'categoria', only: [:index, :show], param: :alias
  resources :products, path: 'produto', only: [:index, :show], param: :alias
end
