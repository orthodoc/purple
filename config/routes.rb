Purple::Application.routes.draw do
  get "patients/new"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :patients, only: [:new]
end
