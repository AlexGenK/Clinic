Rails.application.routes.draw do
  devise_for :users
  resources :categories

  resources :users do
    resources :appointments
  end
  resources :doctors do
    resources :appointments
  end
  resources :appointments

  root to: 'categories#index'
end
