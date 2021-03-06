Rubricam::Application.routes.draw do

  resources :nodes

  resources :nivarts

  resources :version_comments

  resources :parties

  resources :campagnes

  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :users

  root :to => 'accueil#index'
  match '/regles', to: 'accueil#regles'
  match '/fan_art', to: 'accueil#fan_art'
  match '/carte', to: 'accueil#carte'
  match '/navigation', to: 'accueil#navigation'
  match '/cv_elyse_cordeau', to: 'accueil#cv_elyse_cordeau'
  get 'omni_search/search'
  get 'users/omni_search/search'

  resources :arts

  resources :royaumes

  resources :combinaisons

  resources :disciplines

  resources :nivdisciplines

  resources :objets

  resources :routines

  resources :spheres

  resources :lieus

  resources :organisations do
    get :secret_update, on: :member
  end

  resources :historiques

  resources :atouts

  resources :relations do
    get :visuel, on: :collection
  end

  resources :relations_organisations

  resources :capacites

  resources :personnages do
    get :get_infos, on: :collection  #For Ajax test
    get :public_edit, on: :member
    get :public_show, on: :member
    post :public_update, on: :member
    get :routine_edit, on: :member
    post :routine_update, on: :member
    get :discipline_edit, on: :member
    post :discipline_update, on: :member
    get :combinaison_edit, on: :member
    post :combinaison_update, on: :member
    get :pnjs, on: :collection
    get :pjs, on: :collection
    get :reset_xps, on: :member
    get :reset_bonus, on: :member
    get :reset_base, on: :member
    get :background_edit, on: :member
    post :background_update, on: :member
    get :secret_update, on: :member
    get :pnj_update, on: :member
    get :test_update, on: :member
  end

end
