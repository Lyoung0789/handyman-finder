Rails.application.routes.draw do
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/users/:id', to: "users#show" 
  resources :appointments
  resources :technicians
  # resources :users
  get '/', to: "welcome#hello" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
