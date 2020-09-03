Rails.application.routes.draw do

  resources :users, except: [:new, :edit]
  resources :items, except: [:new, :edit]

end
