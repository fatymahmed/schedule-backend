Rails.application.routes.draw do
  get 'schedulex', to: 'schedules#index'
  post 'schedulex', to: 'schedules#create'
  delete 'schedulex/:id', to: 'schedules#destroy'
  get 'talks', to: 'talks#index'
  post 'talks', to: 'talks#create'
  delete 'talks/:id', to: 'talks#destroy'
  get 'talks/:id', to: 'talks#show'
  resources :sessions, only: :create
  resources :registrations, only: :create
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
