Rails.application.routes.draw do
  root 'homepages#home'
  #get 'homepages/home'
  get 'homepages/new'
  get 'homepages/finish'
  get '/new', to: 'kanbans#new'
  post 'kanbans/next'
  post 'kanbans/before'
  resources :kanbans do
    collection {post :import}
  end
end
