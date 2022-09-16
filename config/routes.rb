Rails.application.routes.draw do
  get 'welcome/index'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :trips
  # Defines the root path route ("/")
  root 'welcome#index'
end
