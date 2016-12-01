Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  resources :trains
  resources :railways_stations
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
