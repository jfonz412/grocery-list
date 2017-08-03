Rails.application.routes.draw do
  root 'static_pages#home'

  get    '/login',  to: "sessions#new"
  delete '/logout', to: "sessions#destroy"
  post   '/login',	to: "sessions#create"

  get  'users/new'
  post 'users/new', to: 'users#create'
  get  'users/show'

  get  '/about',	to: 'static_pages#about'
end
