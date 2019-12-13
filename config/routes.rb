Rails.application.routes.draw do
  get 'talks/index'
  get 'talks/create'
  get 'talks/destroy'
  get 'talks/show'
  resources :sessions, only: :create
  resources :registrations, only: :create
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
