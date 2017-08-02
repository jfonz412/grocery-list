Rails.application.routes.draw do
  root 'static_pages#home'
  get  'users/new'
  post 'users/new', to: 'users#create'
  get  'users/show'
  get 'static_pages/about'
end
