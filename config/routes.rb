Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: 'pages#dashboard'
  resources :recipes, only: [:index, :show,] do
    resources :user_recipes, only: [:create]
  end
  resources :user_recipes, only: [:show]

end
