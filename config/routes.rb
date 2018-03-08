Rails.application.routes.draw do
  resources :features
  # root 'application#welcome'

  resources :users
  resources :images, only: %i(create)

  get '/cam' => "images#camera"
  get '/' => 'sessions#new'
  post '/' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
	get '/admin' => 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
