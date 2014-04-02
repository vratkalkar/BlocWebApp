Bloccit::Application.routes.draw do
  
  get "comments/create"
  devise_for :users


  resources :topics do
    resources :posts  do
      resources :comments, only: [:create]
  end
end


  match 'about', to: 'welcome#about', via: :get

  get '/topics/:id', to: 'topics#index', as: 'topics_index'

  post '/topics/:id/posts/new', to: 'topics#show'

  post 'topics/new', to: 'topics#index'

  root to: 'welcome#index'
end
