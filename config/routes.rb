Rubricam::Application.routes.draw do

  resources :parties

  resources :campagnes

  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :users

  root :to => 'accueil#index'
  match '/regles', to: 'accueil#regles'
  match '/fan_art', to: 'accueil#fan_art'
  match '/carte', to: 'accueil#carte'
  match '/navigation', to: 'accueil#navigation'

  resources :arts

  resources :royaumes

  resources :combinaisons

  resources :disciplines

  resources :nivdisciplines

  resources :objets

  resources :routines

  resources :spheres

  resources :lieus

  resources :organisations

  resources :historiques

  resources :atouts

  resources :relations do
    get :visuel, on: :collection
  end

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
  end

end
