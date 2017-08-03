Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about',    to: 'static_pages#about'

  get '/new_list',  to: 'lists#new'
  get '/lists',     to: 'lists#index'
  get 'lists/show'
  get 'lists/edit'

  get    '/login',  to: "sessions#new"
  delete '/logout', to: "sessions#destroy"
  post   '/login',	to: "sessions#create"

  get  'users/new'
  post 'users/new', to: 'users#create'
  get  'users/show'
end
