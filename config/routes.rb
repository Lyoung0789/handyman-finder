Rails.application.routes.draw do
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/users/:id', to: "users#show" 
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :appointments
  resources :technicians
  resources :users
  get '/', to: "welcome#hello" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
