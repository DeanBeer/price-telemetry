Rails.application.routes.draw do

  root 'price_data#new'

  resources :brands, only: [:edit, :index, :show]

  resources :breweries do
    resources :brands, only: [:create, :new, :update]
  end

  resources :group_memberships, only: [:show]
  resources :price_data
  resources :routes
  resources :retailers
  resources :beer_styles

end
