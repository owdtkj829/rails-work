Rails.application.routes.draw do
  devise_for :users
  root :to=>'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  get 'home/about'=>'top#show'
end
