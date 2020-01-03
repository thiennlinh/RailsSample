Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
	root "static_pages#home"
  get 'static_pages/home'

  get "/signup",  to: "users#new"
 	resources :users
 	resources :account_activations, only: :edit
 	resources :password_resets, only: [:new, :create, :edit, :update]
  get 'password_resets/edit'
  get 'password_resets/new'

  resources :relationships, only: [:create, :destroy]

  resources :microposts, only: [:create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
