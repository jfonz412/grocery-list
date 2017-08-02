Rails.application.routes.draw do
  root 'static_pages#home'

  get '/login', to: "sessions#new"
  get '/logout', to: "sessions#destroy"
  post 'sessions/create'

  get  'users/new'
  post 'users/new', to: 'users#create'
  get  'users/show'

  get 'static_pages/about'
end
