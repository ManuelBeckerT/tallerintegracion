Rails.application.routes.draw do
  devise_for :users
  root :to => redirect('/noticia')
  resources :comentarios
  resources :noticia do
    resources :comments 
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
