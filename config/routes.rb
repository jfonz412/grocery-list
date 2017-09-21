Rails.application.routes.draw do
  root 'static_pages#home'

  # Categories
  post 'categories/create'

  # User Items
  post 'user_items/create'
  get  'user_items/destroy'
  get  'user_items/update'
  get  'user_items/index'
  get  'user_items/edit'

  # Static Pages
  get     '/about',    to: 'static_pages#about'

  # Lists
  get     '/new_list',    to: 'lists#new'
  post    '/list',        to: 'lists#create'
  get     '/lists',       to: 'lists#index'
  get     'lists/show',   to: 'lists#show'
  get     'lists/edit'
  delete  'lists/delete', to: 'lists#destroy'
  
  # User sessions
  get    '/login',  to: "sessions#new"
  delete '/logout', to: "sessions#destroy"
  post   '/login',	to: "sessions#create"

  # User signup
  get  'users/new'
  post 'users/new', to: 'users#create'
  get  'users/show'
end
