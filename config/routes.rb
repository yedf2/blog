Rails.application.routes.draw do
  get 'welcome/index'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :trips do
    collection do
      get 'trip_museum_delete'
      get 'trip_museum_toggle'
      get 'trip_delete'
      get 'museums'
    end
  end

  # Defines the root path route ("/")
  root 'users#new'
end
