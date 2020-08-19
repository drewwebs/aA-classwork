Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :update, :destroy] do
    resources :aspirations, only: [:index]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :aspirations, only: [:create, :new, :update, :destroy]

end
