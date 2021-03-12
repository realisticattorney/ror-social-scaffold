Rails.application.routes.draw do
  
  root 'posts#index'
  
  resources :friendships
  
  devise_for :users
  
  resources :users, only: [:index, :show]
  
  resources :posts, only: [:index, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
