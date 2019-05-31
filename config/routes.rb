require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web, at: "/sidekiq"


  get 'calender/index'
  ActiveAdmin.routes(self)
  namespace :admin do
    resource :graphs, only: [:show]
  end
  root to: 'groups#index'
  get 'signup', to: 'users#new'
  #resources :tasks
  resources :users, only: [:new, :create]
  resources :groups, shallow: true do
    resources :tasks
    resources :custom_task_lists, only: [:index] do
      put :sort
    end
    resources :members
    resources :calenders, only: [:index]
  end
  resource :plofile, only: [:show, :edit, :update]
  post 'plofile', to: 'plofiles#update'
  get 'users', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'read/:id', to: 'notification_reads#create', as: 'read'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
