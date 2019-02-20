Rails.application.routes.draw do
  resources :awards
  resources :educations
  resources :skills
  resources :experiences
  resources :positions
  resources :members, param: :custom_id
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'

end
