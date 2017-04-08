Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles

  #the root route to my app to redirect the user to the home page of the blog
  root 'pages#home'

  get 'signup' , to: "users#new"

  get 'login' , to:"sessions#new"
  post  'login' , to:"sessions#create"

  delete 'logout', to:"sessions#destroy"

  resources :users, except: [:new]
  resources :categories, except: [:delete]
end
