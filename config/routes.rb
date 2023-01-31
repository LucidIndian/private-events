Rails.application.routes.draw do
 
  get 'users/show'
  
  devise_for :users
  root to: "events#index"

  resources :events, only: [ :new, :create, :show, :index ]
  
  resources :rsvps
  get 'rsvps/accept'
  get 'rsvps/refuse'
  # get 'rsvps/index'
end
