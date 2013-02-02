Tracktor::Application.routes.draw do
  devise_for :users

  resources :products do
    resources :issues
  end
  resources :issues do
    member do
      put :continue
      put :stop
      post :move
    end
  end

  root :to => "dashboard#index"
end
