Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'articles#index', as: "article"
  get '/articles/new' => 'articles#new', as: 'article_new'
  get '/articles/:id' => 'articles#show'
  delete '/articles/:id' => 'articles#delete', as: 'article_delete'
  get '/articles/:id/edit' => 'articles#edit', as: 'article_edit'
  put '/articles/:id' => 'articles#update', as: 'article_update'
  post '/articles' => 'articles#create', as: 'article_create'

  #user
  get '/sign-up' => 'users#new'
  post '/sign-up' => 'users#create', as: 'user_new'

  #session (login)
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #redirect to article path if route not available
  get '*path' => redirect('/')

end
