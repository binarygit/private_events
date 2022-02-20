Rails.application.routes.draw do
  get "signup", to: "users#new"
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  resources :events
  resources :event_attendances
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
