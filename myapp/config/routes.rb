Rails.application.routes.draw do
  devise_for :users
  root :to => redirect('/noticia')

  #post '/news/' => 'noticia#index'
  resources :noticia do
    resources :comments
  end
  resources :users
  namespace :api, defaults: { format: "json" } do
    resources :noticia, only: [:index, :create, :show, :update, :destroy]

  end
  # NEWS
  get 'api/news/' => 'api/noticia#index'
  post 'api/news/' => 'api/noticia#create'
  get 'api/news/:id' => 'api/noticia#show'
  delete 'api/news/:id' => 'api/noticia#destroy'
  # comments
  get 'api/news/:id/comments' => 'api/noticia#index_comments'
  post 'api/news/:id/comments' => 'api/noticia#create_comments'
  delete 'api/news/:id/comments/:id2' => 'api/noticia#destroy_comment'
  get 'api/news/:id/comments/:id2' => 'api/noticia#show_comment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
