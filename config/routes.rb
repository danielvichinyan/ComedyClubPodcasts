Rails.application.routes.draw do

  devise_for :users
  root 'podcasts#index'
  resources :podcasts do
    collection do
      # Search route
      get :search
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
