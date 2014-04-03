Bloccit::Application.routes.draw do
  
  devise_for :users


  resources :topics do
    resources :posts  do
      resources :comments, only: [:create]
  end
end

  match 'about', to: 'welcome#about', via: :get

  root to: 'welcome#index'
end
