Rails.application.routes.draw do
  get 'rsvps/index'
  get 'rsvps/accept'
  get 'rsvps/refuse'

  get 'users/show'
  
  devise_for :users
  root to: "events#index"

  resources :events, only: [ :new, :create, :show, :index ]
  
  resources :rsvps
end
