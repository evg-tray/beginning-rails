Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'welcome/index'

  root 'welcome#index'

  resource :search, only: [:show, :create]
  resources :tickets, only: [:show, :create, :new, :index, :destroy]
  match "/tickets/buy" => "tickets#new", :via => :post, :as => :buy_ticket
  namespace :admin do
    get 'main/index'
    root 'main#index'
    resources :trains do
      resources :wagons, shallow: true
      patch :update_number, on: :member
    end
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
    resources :routes do
      patch :update_name, on: :member
    end
    resources :tickets
    match "/tickets/buy" => "tickets#new", :via => :post, :as => :buy_ticket
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
