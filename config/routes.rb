Bloccit::Application.routes.draw do
  
  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end


  match 'about', to: 'welcome#about', via: :get

  get '/topics/:id', to: 'topics#index', as: 'topics_index'

  post 'topics/new', to: 'topics#index'

  root to: 'welcome#index'
end
