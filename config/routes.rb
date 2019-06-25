Rails.application.routes.draw do
  resources :tables, only:[:index, :show]
  resources :users, only:[:index, :show]
  resources :orders, only:[:create, :update, :destroy]
  resources :cook_sessions, only:[:index, :show, :create, :update, :destroy]
  resources :recipes, only:[:index]
  resources :ingredients, only:[:index]
  resources :pots, only:[:index]

  post '/signup', to: 'users#create'
  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  mount ActionCable.server => '/cable' # moved this below login
  # get '/erase_orders', to: 'orders#erase_orders' <-- used in development
  post '/pay_bill', to: 'users#pay_bill'
  post '/cancel', to: 'orders#cancel'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
