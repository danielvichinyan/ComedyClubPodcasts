Rails.application.routes.draw do

  devise_for :users
  root 'podcasts#index'
  resources :podcasts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
