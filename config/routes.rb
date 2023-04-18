Rails.application.routes.draw do
  resources :clients do
    patch :update_status, on: :member
  end
  get 'search',to: "clients#search"


  post 'users/sort',to: "clients#sortusers"
  post 'users/sortbyemail',to: "clients#sortByEmail"

  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  get 'users', to: 'user#index'
  get 'myprofile',to: "dashboard#myprofile"
  get 'editprofile',to: "dashboard#editprofile"
  post 'updateprofile',to: "dashboard#update_profile"
  patch 'updateprofile',to: "dashboard#update_profile"

  get 'news',to: "dashboard#news"
  get 'project',to: "dashboard#project"


  # Defines the root path route ("/")
  # root "articles#index"
end
