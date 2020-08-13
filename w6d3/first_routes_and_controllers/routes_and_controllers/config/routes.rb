Rails.application.routes.draw do
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:index, :show, :update, :destroy, :create] do

    resources :artworks, only: :index
    resources :comments, only: :index
    
  end
  # get "users/:id", to: "users#show", as: "user"
  # get "users", to: "users#index", as: "users"
  # post "users", to: "users#create"#, as: "user"
  # get "users/new", to: "users#new", as: "new_user"
  # get "users/:id/edit", to: "users#edit", as: "edit_user"
  # patch "users/:id", to: "users#update"#, as: "user"
  # put "users/:id", to: "users#update"#, as: "user"
  # delete "users/:id", to: "users#destroy"#, as: "user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :artworks, only: [:show, :update, :destroy, :create] do
    resources :comments, only: :index
  end

  resources :artwork_shares, only: [:create, :destroy]
end


