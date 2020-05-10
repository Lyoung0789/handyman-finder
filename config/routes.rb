Rails.application.routes.draw do
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/users/:id', to: "users#show" 
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  

  get '/auth/facebook/callback' => 'sessions#fbcreate'
  get '/auth/github/callback' => 'sessions#githubcreate'
  

  resources :appointments, except: [:index]
  resources :technicians
  resources :users, except: [:index, :destroy]

  root "welcome#hello" 

  resources :technicians do 
    resources :appointments, only: [:new, :index]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
