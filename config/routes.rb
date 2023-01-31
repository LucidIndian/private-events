Rails.application.routes.draw do
  root to: "events#index"

  get 'events/index'
end
