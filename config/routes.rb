Recettes::Application.routes.draw do

  get "recherche", to: "recherche#show"
  get "recherche_ingredient", to: "recherche#ingredient"
  get "users/:id", to: "users#show"
  get "profile", to: "users#profile"
  get "mes_recettes", to: "users#recettes"
  get "vote_up/:recette_id", to: "users#vote_up"
  get "vote_down/:recette_id", to: "users#vote_down"
  get "comment/:recette_id", to: "users#comment"
  get "recettes/new/:recette_id", to: "recettes#new"
 
  resources :ingredients
  resources :recettes


  resource :recettes do
    match "updatePhoto", :on => :collection
  end

  root :to => "home#index"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'session#error'
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
