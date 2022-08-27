Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # put '/post/:id/like' to: 'posts#like', as: 'like'
 
  resources :users, only: [:index, :show] do
    resources :posts, only:[:index, :show, :new, :create] do 
      resources :comments, only: [:new, :create]
      resources :likes,only:[:create, :destroy]
    end
  end
end
