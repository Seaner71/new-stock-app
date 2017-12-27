Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :users
  resources :accounts do
    resources :stocks
  end
  root 'welcome#index'
  post '/' => 'welcome#index'
end
