Rails.application.routes.draw do
  root 'users#new'
  get  'users/new'
  get  'users/show'
end
