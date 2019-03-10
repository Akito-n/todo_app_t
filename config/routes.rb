Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/new'
  get 'groups/create'
  get 'groups/edit'
  get 'groups/update'
  get 'groups/destroy'
  ActiveAdmin.routes(self)
  root to: 'tasks#index'
  get 'signup', to: 'users#new'
  resources :tasks
  resources :users, only: [:new, :create]
  get 'users', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
