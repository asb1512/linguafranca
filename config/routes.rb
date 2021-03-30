Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #static routes
  root 'static#welcome'
  get '/about', to: 'static#about'

  #user routes
  get '/signup', to: 'users#new'
  get '/user/:id/friends', to: 'users#friends', as: 'user_friends'
  resources :users, only: [:create, :show, :edit, :update, :destroy] do
    resources :invitations
  end
  get '/home', to: 'users#home'
  
  #language routes
  resources :languages

  #session routes
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #invitation routes
  post '/invite/:id', to: 'invitations#create', as: 'invite'

  #admin routes
  get '/dashboard', to: 'admin#dashboard'
end