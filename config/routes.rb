Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contestants#index"

  namespace :contestant do
    resources :ratings
  end

  resources :admin, only: :index

  namespace :admin do
    resources :members
  end
end
