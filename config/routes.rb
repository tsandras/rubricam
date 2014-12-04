Rubricam::Application.routes.draw do

  resources :arts


  resources :royaumes


  resources :combinaisons


  resources :disciplines


  resources :objets


  resources :routines


  resources :spheres


  resources :lieus


  root :to => 'accueil#index'

  resources :organisations

  resources :historiques

  resources :atouts

  resources :relations

  resources :capacites

  resources :personnages

end
