Rails.application.routes.draw do
  root 'projects#index'

  get 'register' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  resources :projects
  resources :tickets do
    resources :comments, only: %i[create edit update]
  end
  resources :tags, except: :show
  resources :users, only: %i[create delete]
end
