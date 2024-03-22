Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: 'pages#dashboard'
  resources :recipes, only: %i[index show] do
    resources :user_recipes, only: [:create]
  end
  resources :user_recipes, only: [:show]
  get '/cookbook', to: 'pages#cookbook'
  patch '/update_user_badge/:id', to: 'user_badges#update', as: 'update_user_badge'
end
