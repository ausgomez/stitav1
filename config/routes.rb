Rails.application.routes.draw do
  get 'all_users/index'
  devise_for :users

  resources :awards
  resources :educations
  resources :skills
  resources :experiences
  resources :positions
  resources :members, param: :custom_id
  resources :all_users

  # match edit and create methods to make it possible to update users's info out of devise
  match '/all_users/new', to: 'all_users#create', via: :post
  match '/all_users/:id/edit', to: 'all_users#update', via: :patch

  root to: 'pages#home'
  get 'pages/home'

end
