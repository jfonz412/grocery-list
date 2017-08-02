Rails.application.routes.draw do
  root 'static_pages#home'
  get  'users/new'
  get  'users/show'
  get 'static_pages/about'
end
