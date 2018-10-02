Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "signin", to: 'devise/sessions#new'
    delete "signout", to: 'devise/sessions#destroy'
    get "signup", to: 'devise/registrations#new'
  end
  
  get 'feed', to: 'feed#show'
  get 'users/:username', to: 'users#show', as: 'user'
  
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end
  resources :photos
  resources :tweets
  
  get 'pages/home'
  get 'pages/about'
  get 'pages/tweets'
  get 'pages/photos'
  root "pages#home"
  get 'about', to: 'pages#about', slug: 'page_about'
  get 'tweets', to: 'pages#tweets', slug: 'page_tweets' 
  get 'photos', to: 'pages#photos', slug: 'page_photos'
  get 'items', to: 'pages#items', slug: 'page_items'
  get 'users', to: 'pages#users', slug: 'page_users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
