Yetsy::Application.routes.draw do
  root to: "root#index"
  # figure out what to do with search

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show, :update] do
    resources :favorites, only: [:index, :create, :destroy]
    resources :purchases, only: [:index]    
  end
  
  resources :items
  resources :shops, only: [:new, :create, :show, :edit, :update] do 
    resources :orders, only: [:index]
  end
  
end
