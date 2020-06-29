Rails.application.routes.draw do
  root 'homepages#home'
  #get 'homepages/home'
  get 'homepages/new'
  get 'homepages/finish'
  get '/new', to: 'kanbans#new'
  post 'kanbans/next'
  post 'kanbans/before'
  post 'tags/come'
  get 'tags/view'
  resources :kanbans do
    collection {post :import}
  end
  resources :tags do
    collection {post :import}
  end
  resources :lanes do
    collection {post :import}
  end
end
