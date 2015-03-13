Rubricam::Application.routes.draw do

  resources :parties


  devise_for :users

  resources :users

  root :to => 'accueil#index'

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

  resources :relations

  resources :capacites

  resources :personnages do
    get :get_infos, on: :collection  #For Ajax test
    get :public_edit, on: :member
    get :public_show, on: :member
    post :public_update, on: :member
    get :routine_edit, on: :member
    post :routine_update, on: :member
    get :pnjs, on: :collection
  end

end
