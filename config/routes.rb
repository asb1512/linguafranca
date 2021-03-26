Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#welcome'
  get '/about', to: 'static#about'

  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]
  get '/home', to: 'users#home'
  
  resources :languages

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end