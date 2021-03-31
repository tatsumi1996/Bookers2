Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" =>"homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :books, only: [:new, :create, :index, :edit, :update, :show, :destroy]


resources :users, only: [:show, :edit, :update, :index]

end