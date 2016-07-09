Rails.application.routes.draw do

  root 'home#index'

  resources :sub_categories
  resources :products

  namespace :admin do
    root 'products#index'
    resources :products
    resources :categories do
      resources :sub_categories
    end
  end
end
