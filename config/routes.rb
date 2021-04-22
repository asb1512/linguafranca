Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #static routes
  root 'static#welcome'
  get '/about', to: 'static#about'

  #github omniauth
  match '/auth/:provider/callback', to: 'sessions#github_oauth', via: [:get, :post]

  #user routes
  get '/signup', to: 'users#new' 
  get '/user/:id/friends', to: 'users#friends', as: 'user_friends'
  resources :users, only: [:create, :show, :edit, :update, :destroy] do
    resources :invitations
  end
  get '/home', to: 'users#home'
  
  #language routes
  resources :languages
  get '/languages/:id/approve', to: 'languages#approve', as: 'language_approve'

  #session routes
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #flag routes
  resources :flags
  get '/flags/:id/approve', to: 'flags#approve', as: 'flag_approve'

  #invitation routes
  post '/invite/:id', to: 'invitations#create', as: 'invite'

  #admin routes
  get '/admin/dashboard', to: 'admin#dashboard'
  get '/admin/new_user', to: 'admin#new_user'
  post '/admin/create_user', to: 'admin#create_user'
end