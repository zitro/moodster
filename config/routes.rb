Rails.application.routes.draw do
  # root 'application#welcome'

  resources :user_emotions
  resources :emotions
  resources :photos
  resources :users
  get '/' => 'sessions#new'
  post '/' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
