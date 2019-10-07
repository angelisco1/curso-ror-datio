Rails.application.routes.draw do
  resources :usuarios
  # get 'categorias/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/ingredientes', to: 'ingredientes#index'
  # get '/productos/:id', to: 'ingredientes#show', as: :ingredientes
  # resources :categorias, except: [:show, :new]
  # resources :categorias, only: :index
  resources :categorias, except: :show
  resources :ingredientes, except: :show
  resources :recetas

end
