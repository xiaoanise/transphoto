Rails.application.routes.draw do
  root to: 'transphotos#index'
  resources :transphotos, only: [:index, :new, :create, :destroy, :edit, :update, :show]
end
