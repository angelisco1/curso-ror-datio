Rails.application.routes.draw do
  devise_for :usuarios, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Definimos la ruta raíz (inicial) de la aplicación
  # root 'application#home'
  # get '/' => 'application#home' # Equivale a la de arriba

  # get '/hola' => 'saludos#saludo_generico'
  root 'saludos#saludo_generico'
  get '/bienvenido/:nombre' => 'saludos#saludo_personal', as: :bienvenido, constraints: { nombre: /[A-Z]\w*/ }
  get '/hola', to: redirect('/')



  # resources :films
  # resources :films, only: [:index, :new, :create]
  # resources :films, except: [:show, :edit, :update, :destroy]
  # resources :films do
  #   resources :characters
  # end
  # scope :admin do
  #   resources :films
  # end


  # get '/lista-tareas' => 'lista_tareas#index'
  # get '/lista-tareas/home' => 'application#home'
  # resources :lista_tareas
  # Ponemos la siguiente ruta porque usariamos esa misma con PUT o PATCH que están definidas, pero en HTML5 forms solo se pueden hacer peticiones GET y POST
  # post '/lista_tareas/:id', to: 'lista_tareas#update'


  # Con el scope le indicamos que ponga el prefijo mi-todolist antes de cada ruta que se genere dentro de este bloque
  # scope '/mi-todolist' do
  #   resources :lista_tareas
  # end

  # get 'categorias' => 'categorias#index'
  # post 'categorias' => 'categorias#create'
  # get 'categorias/new' => 'categorias#new', as: :new_categoria
  # get 'categorias/:id/edit' => 'categorias#edit', as: :edit_categoria
  # get 'categorias/:id' => 'categorias#show'#, as: :categoria
  # put 'categorias/:id' => 'categorias#update', as: :categoria
  # patch 'categorias/:id' => 'categorias#update'#, as: :categoria
  # delete 'categorias/:id' => 'categorias#destroy', as: :delete_categoria
  # resources :categorias




########## AQUI EMPIEZAN
  # root 'recetas#index'
  get 'perfil' => 'usuarios#perfil'
  resources :categorias, :except => [:show]
  resources :ingredientes, :except => [:show]
  resources :recetas
  put 'recetas/:id/votar' => 'recetas#votar', as: 'votar_receta'
  get 'usuarios/:id/recetas' => 'recetas#recetas_usuario', as: 'recetas_de_usuario'
########## AQUI TERMINAN

  # Con el as: le ponemos el prefix que queramos.
  # get 'categorias' => 'categorias#index', as: :paquito

end
