Rails.application.routes.draw do
  resources :bands do 
    resources :albums, only: :index
  end

  resources :albums
  resources :users, only: [:create,:new]
  resource :session, only: [:new,:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/bands')
end
