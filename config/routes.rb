Blog::Engine.routes.draw do
  root "articles#index"

  resources :articles

  namespace :admin do
    resources :articles
    root to: 'articles#index'
  end
end
