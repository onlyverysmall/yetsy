Yetsy::Application.routes.draw do
  root to: "root#index"

  resource :session, only: [:new, :create, :destroy]
  resource :cart, only: [:show, :create, :destroy]

  resources :users, only: [:new, :create, :show, :update] do
    resources :favorites, only: [:index]
    resources :purchases, only: [:index]    
  end
  
  resources :favorites, only: [:create, :destroy]
  resources :orders, only: [:create, :update]
  resources :items
  resources :shops, only: [:new, :create, :show, :edit, :update] do 
    resources :orders, only: [:index]
  end
  
end
