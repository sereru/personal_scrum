Rails.application.routes.draw do
  root 'homepages#home'
  #get 'homepages/home'
  get 'homepages/new'
  get 'homepages/finish'
end
