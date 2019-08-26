Rails.application.routes.draw do
  root 'tacos#index'
  devise_for :users
  resources :tacos
end
