Rails.application.routes.draw do

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1  do
    resources :contacts
    resources :sessions, only:[:create,:destroy]
    resources :users, only:[:index,:create,:destroy]
    resources :tokens, only:[:create]
  end
  namespace :admin do
  resources :users
  end

  
end
