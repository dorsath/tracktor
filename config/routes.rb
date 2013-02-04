Tracktor::Application.routes.draw do
  devise_for :users

  resources :projects do
    resources :issues
    resources :sprints
  end

  
  resource :dashboard

  resources :issues do
    member do
      put :continue
      put :stop
      put :start
      put :complete
      put :reject
      put :accept
      put :reopen
      post :move
    end
  end
  resources :sprints

  root :to => "dashboards#show"
end
