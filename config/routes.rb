Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/articles' => 'articles#index'
  get '/articles/new' => 'articles#new', as: 'article_new'
  get '/articles/:id' => 'articles#show'
  delete '/articles/:id' => 'articles#delete', as: 'article_delete'
  get '/articles/:id/edit' => 'articles#edit', as: 'article_edit'
  put '/articles/:id' => 'articles#update', as: 'article_update'
  post '/articles' => 'articles#create', as: 'article_create'
end
