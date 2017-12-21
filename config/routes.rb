Rails.application.routes.draw do
  get 'stocks/index'

  get 'stocks/show'

  devise_for :users
  get 'welcome/index'
  resources :users
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
