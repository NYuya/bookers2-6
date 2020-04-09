Rails.application.routes.draw do

  get 'search/search'
  get '/search' => 'search#search'
  devise_for :users

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end

  resources :users,only: [:show,:index,:edit,:update]
  resources :relationships, only: [:create, :destroy]

  get 'followed/:id' => 'relationships#followed', as: 'followed'
  get 'follower/:id' => 'relationships#follower', as: 'follower'

  root 'home#top'
  get "home/about" => "home#about"


end