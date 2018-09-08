Rails.application.routes.draw do
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "signin" => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get "signup" => 'devise/registrations#new'
  end
  get 'pages/home'
  get 'pages/about'
  get 'pages/tweets'
  get 'pages/admin'
  root "pages#home"
  get 'about' => 'pages#about', slug: 'page_about'
  get 'about' => 'pages#tweets', slug: 'page_tweets' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
