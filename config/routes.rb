Rails.application.routes.draw do

  root 'products#index'

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  namespace :admin do
    resources :products
    resources :categories do
      resources :sub_categories
    end
  end
end
