Rails.application.routes.draw do
  devise_for :users
  root :to => redirect('/noticia')

  #post '/news/' => 'noticia#index'
  resources :noticia do
    resources :comments
  end
  resources :users
  namespace :api do
    resources :noticia, only: [:index, :create, :show, :update, :destroy]

  end
  get 'api/news/' => 'api/noticia#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
