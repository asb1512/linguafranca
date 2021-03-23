Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]
  
  resources :languages

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
end