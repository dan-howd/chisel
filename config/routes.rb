Blog::Engine.routes.draw do
  root "articles#index"

  resources :articles
  resources :projects

  namespace :admin do
    resources :articles
    resources :projects
    root to: 'articles#index'
  end
end
