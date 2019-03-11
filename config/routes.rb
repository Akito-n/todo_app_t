Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'groups#index'
  get 'signup', to: 'users#new'
  #resources :tasks
  resources :users, only: [:new, :create]
  resources :groups, shallow: true do
    resources :tasks
    resources :members
  end
  get 'users', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  put 'read/:id', to: 'notification_reads#update', as: 'read'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
