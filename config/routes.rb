Rails.application.routes.draw do

  get 'favorites/index'

  get 'topics/new'

  get 'sessions/new'

  get 'users/new'

  get 'pages/index'

    root 'pages#index'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources 'users'
    resources 'topics'

    post '/favorites', to: 'favorites#create'
    get '/favorites', to: 'favorites#index'

    post "/topics/comment_create" =>"topics#comment_create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
