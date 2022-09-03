Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # put '/post/:id/like' to: 'posts#like', as: 'like'
 
   root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts do 
      resources :comments, only: [:new, :create]
      resources :likes,only:[:create, :destroy]
    end
  end
end
