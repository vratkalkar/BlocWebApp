Bloccit::Application.routes.draw do
  get "welcome/index"
  get "welcome/about"
  get "weclome/index"
  get "welcome/about"

  root to: 'welcome#index'
end
