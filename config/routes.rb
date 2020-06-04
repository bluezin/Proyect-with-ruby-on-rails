Rails.application.routes.draw do
  resources :categories
  devise_for :users
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenido", to: "home#index"
  root "home#index"
  get "perfil", to: "users#edit"
  resources :users, only: [:update]

  resources :articles do
  get "/user/:user_id", to: "articles#from_author", on: :collection
  end
  #deve tener su propia ruta
  #get "articles", to: "articles#index"

  #get "articles/new", to: "articles#new", as: :new_articles
  #get "articles/:id", to: "articles#show"
  #get "articles/:id/edit", to: "articles#edit"

  #patch "/articles/:id", to: "articles#update", as: :article

 #post "articles", to:"articles#create"
 #delete "articles/:id", to:"articles#destroy"
end
