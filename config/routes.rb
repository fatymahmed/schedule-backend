Rails.application.routes.draw do
  resources :users, only: [] do
    resources :schedules, only: [:index, :destroy, :create]
  end
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
