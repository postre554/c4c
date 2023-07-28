Rails.application.routes.draw do
  resources :comments
  resources :publications
  get 'home/index'
  devise_for :users


  root to: 'home#index'



  resources :publications do
    member do
      post 'like'
      post 'dislike'
    end
    resources :comments, only: [:index, :create, :destroy] #repasar dependencias de rutas
    resources :reactions, only: [:create, :destroy]
  end

  resources :publications do
    resources :comments, only: [:new, :create]  
  end



end
