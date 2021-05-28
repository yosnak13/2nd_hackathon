Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations:  'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
  }

  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'verify', to: 'users/registrations#verify'
    get 'logout', to: 'users/sessions#destroy'
  end

  # 管理者機能
  get 'admin/posts_index', to: 'admin#posts_index', as: 'posts_index'
  get 'admin/users_index', to: 'admin#users_index', as: 'users_index'
  get 'admin/:id', to: 'admin#show_user', as: 'show_user'
  delete 'admin/:id/delete', to: 'admin#delete_post', as: 'delete_post'
  delete 'admin/:id', to: 'admin#delete_user', as: 'delete_user'

  resources :users, except: [:index] do
    member do
      get 'mypage', to: 'users#mypage'
      get 'mypost', to: 'users#mypost'
    end
  end

  root to: 'users#index'
  get 'home/index'
  get 'home/about', as: 'about'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end