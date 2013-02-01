Tracktor::Application.routes.draw do
  devise_for :users

  resources :products
  root :to => "dashboard#index"
end
