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

  root to: 'users#index'
  get 'home/index'

  resources :posts, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
