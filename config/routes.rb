Rails.application.routes.draw do
  get 'contacts/new'

  root "users#index"
  get 'add/:id' => 'users#add'
  get 'login' => 'sessions#new', as: 'new_login'
  post 'login' => 'sessions#create', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  # get 'profile' => 'users#profile'
  resources :users
  resources :contacts
end
