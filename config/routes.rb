Recettes::Application.routes.draw do
  resource :recipes

  root :to => "home#index"
  match 'recipes/list', to: 'recipes#list'
  #match 'recipes/new', to: 'recipes#new'
  #match 'recipes/edit', to: 'recipes#edit'
  #match 'recipes/show', to: 'recipes#show'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
