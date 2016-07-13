Rails.application.routes.draw do

  root 'home#index'

  resources :sub_categories
  resources :products

  namespace :admin do
    root 'products#index'
    resources :products, except: :show
    resources :categories, except: :show do
      resources :sub_categories
    end
  end
end
