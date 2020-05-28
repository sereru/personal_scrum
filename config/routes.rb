Rails.application.routes.draw do
  root 'homepages#home'
  #get 'homepages/home'
  get 'homepages/new'
  get 'homepages/finish'
  get '/new', to: 'kanbans#new'
  resources :kanbans
end
