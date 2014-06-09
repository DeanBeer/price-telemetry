Rails.application.routes.draw do

  root 'price_data#new'

  resources :brands, only: [:edit, :index, :show]

  resources :breweries do
    resources :brands, only: [:create, :new, :update]
  end

  resources :price_data

  resources :routes

  resources :retailers

end
