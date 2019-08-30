Rails.application.routes.draw do
  root 'projects#index'

  get 'register' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  resources :projects
  resources :tickets
  resources :tags, except: :show
  resources :users, only: %i[create delete]
end
