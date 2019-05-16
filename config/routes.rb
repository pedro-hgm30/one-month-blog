Rails.application.routes.draw do
  devise_for :authors
  resources :posts
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'themonth', to: 'months#themonth', as: 'themonth'
  get ':author', to: 'posts#author', as: 'author'
  root 'posts#index'
end
