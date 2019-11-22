Rails.application.routes.draw do

  devise_for :users
  # Making home page the root page
  root 'home#index'

  get 'home/about', to: 'home#about'

  resources :podcasts do
    collection do
      # Search route
      get :search
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
