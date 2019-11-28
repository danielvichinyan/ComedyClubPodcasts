Rails.application.routes.draw do

  devise_for :users
  # Making home page the root page
  root 'home#index'

  get 'home/about', to: 'home#about'
  get 'home/contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  get 'home/comedians', to: 'home#comedians'

  resources :podcasts do
    resources :comments
    collection do
      get :search
    end
  end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
