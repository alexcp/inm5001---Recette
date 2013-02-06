Recettes::Application.routes.draw do
  resources :recipes

  root :to => "home#index"
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'session#error'
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
