Recettes::Application.routes.draw do
  resources :ingredients
  resources :recettes
  root :to => "home#index"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'session#error'
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
