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
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  get ':author', to: 'posts#author', as: 'author'
  get 'author/manage', to: 'authors#manage'
  match 'authors/:id' => 'authors#destroy', :via => :delete, :as => :admin_destroy_author
  root 'posts#index'
end
 
