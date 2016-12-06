Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  resources :trains
  resources :railway_stations
  resources :routes
  resources :wagon_types
  resources :wagons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
