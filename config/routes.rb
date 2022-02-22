Rails.application.routes.draw do
  devise_for :users
  root to: 'transphotos#index'
  resources :transphotos, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    resources :comments, only: :create
  end
  resources :users, only: [:edit, :update, :show]
end
