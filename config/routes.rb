Rails.application.routes.draw do

  root 'home#index'

  resources :categories
  resources :sub_categories

  namespace :admin do
    root 'products#index'
    resources :products
    resources :categories do
      resources :sub_categories
    end
  end
end
