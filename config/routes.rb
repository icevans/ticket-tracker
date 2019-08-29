Rails.application.routes.draw do
  root 'projects#index'

  get 'register' => 'users#new'

  resources :projects
  resources :tickets
  resources :tags, except: :show
  resources :users, only: %i[create delete]
end
