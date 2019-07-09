Rails.application.routes.draw do
  devise_for :users
  devise_for :authors,
    controllers: {:registrations => "registrations"}
  as :author do
    get "/register", to: "registrations#new", as: "register"
  end
  resources :posts do
    resources :comments
  end
  get 'about', to: 'posts#about', as: 'about'
  get 'contact', to: 'posts#contact', as: 'contact'
  get ':id', to: 'posts#author', as: 'author'
  get 'author/manage', to: 'authors#manage'
  match 'authors/:id' => 'authors#destroy', :via => :delete, :as => :admin_destroy_author
  match 'users/:id' => 'authors#delete', :via => :delete, :as => :admin_destroy_user
  root 'posts#index'
end
 
