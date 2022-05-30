Rails.application.routes.draw do
  devise_for :users
  resources :categories

  root to: 'categories#index'
end
