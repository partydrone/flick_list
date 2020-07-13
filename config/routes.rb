Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard' => 'dashboard#show'

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout' => 'logout#logout'

  namespace :admin do
    resources :users, only: [:index]
  end

  root to: 'pages#home'
end
