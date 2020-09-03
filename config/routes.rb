Rails.application.routes.draw do

  resources :items, except: [:new, :edit]
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

end
