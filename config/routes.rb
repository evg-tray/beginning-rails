Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  resources :trains do
    resources :wagons, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resource :search, only: [:show, :create]
  resources :tickets, only: [:show, :create, :new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
