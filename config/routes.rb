Rails.application.routes.draw do
  get 'pages/home'
  get '/report/bug', to: 'pages#bug'
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :awards
  resources :educations
  resources :skills
  resources :experiences
  resources :positions
  resources :members, param: :custom_id
  resources :all_users
  resources :subscribers

  # match edit and create methods to make it possible to update users's info out of devise
  match '/all_users/new', to: 'all_users#create', via: :post
  match '/all_users/:id/edit', to: 'all_users#update', via: :patch

  get 'all_users/index'

end
