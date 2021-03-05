Rails.application.routes.draw do

  resources :friendships
  root 'posts#index'
  
  devise_for :users
  
  resources :friendships do
    member do
      post 'accept', to: 'friendships#confirm'
      post 'reject', to: 'friendships#reject'
    end
  end

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
