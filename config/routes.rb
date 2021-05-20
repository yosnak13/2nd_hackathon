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
  get 'admin/:id', to: 'admin#show_users', as: 'show_users'

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
