Rails.application.routes.draw do
  resources :books
  root :to => 'info#index'
end
