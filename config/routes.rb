Rails.application.routes.draw do
 
  get 'users/show'
  
  devise_for :users

  root to: "events#index"

  resources :events, only: [ :new, :create, :show, :index, :destroy ]
  
  resources :rsvps
  post 'rsvps/accept'
  get 'rsvps/accept'
  get 'rsvps/refuse'
  # get 'rsvps/index'
end
