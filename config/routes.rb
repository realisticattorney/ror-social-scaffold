Rails.application.routes.draw do

  resources :friendships
  root 'posts#index'
  
  devise_for :users
  
  resources :friendships do
    member do
      post 'accept', to: 'friendships#confirm'
      post 'reject', to: 'friendships#reject'
      post 'destroy', to: 'friendships#destroy'
    end
  end

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create, :destroy] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
