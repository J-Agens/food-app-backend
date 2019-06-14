Rails.application.routes.draw do
  resources :tables, only:[:index, :show]
  resources :users, only:[:index, :update, :destroy]
  resources :orders, only:[:create, :update, :destroy]
  resources :cook_sessions, only:[:index, :show, :create, :update, :destroy]
  resources :recipes, only:[:index]
  resources :ingredients, only:[:index]
  resources :pots, only:[:index]
  mount ActionCable.server => '/cable'
  post '/signup', to: 'users#create'
  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  get '/erase_orders', to: 'orders#erase_orders'

  # get 'ingredients/index'
  # get 'recipe_ingredients/index'
  # get 'recipes/index'
  # get 'pots/index'
  # get 'cook_sessions/index'
  # get 'cook_sessions/show'
  # get 'cook_sessions/create'
  # get 'cook_sessions/update'
  # get 'cook_sessions/destroy'
  # get 'parties/index'
  # get 'parties/create'
  # get 'parties/update'
  # get 'parties/destroy'
  # get 'orders/create'
  # get 'orders/update'
  # get 'orders/destroy'
  # get 'tables/index'
  # get 'tables/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
