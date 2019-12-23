Rails.application.routes.draw do
  resources :users, only: [] do
    resources :schedules, only: [:index, :destroy, :create]
    # get 'schedule_id', to: 'schedules#schedule_id'
  end
  get 'talks', to: 'talks#index'
  resources :sessions, only: :create
  resources :registrations, only: :create
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'talks#index'
end
