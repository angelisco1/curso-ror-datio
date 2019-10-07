class ListaTareasController < ApplicationController

  $lista_tareas = [
    {:id => 1, :titulo => 'Comprar boli azul con tinta roja que pinte de verde', :hecha => false},
    {:id => 2, :titulo => 'Hacer ajo atao', :hecha => true},
    {:id => 3, :titulo => 'Practicar a tirar aviones de papel desde el quinto', :hecha => false},
    {:id => 4, :titulo => 'Patentar algo, lo que sea', :hecha => false},
  ]

  protect_from_forgery with: :null_session

  def index
    @lista_tareas = $lista_tareas
    render 'index'
  end

  def new
    @tarea = {}
    puts "Nueva tarea"
  end

  def create
    puts "Params: #{tarea_params}"
    $lista_tareas << {:id => $lista_tareas.last[:id]+1, :titulo => tarea_params['titulo'], :hecha => tarea_params['hecha'] || false}
    redirect_to lista_tareas_path
  end

  def edit
    id = tarea_params[:id].to_i
    @tarea = $lista_tareas.find{|t| t[:id] == id}
  end

  def update
    id = tarea_params[:id].to_i
    # puts "ID: #{id}"
    # puts "Lista Tareas: #{$lista_tareas}"
    $lista_tareas.each do |t|
      if t[:id] == id
        t[:hecha] = not(t[:hecha])
        if tarea_params[:titulo]
          t[:titulo] = tarea_params[:titulo]
        end

        # puts "Tarea actualizada: #{t}"
      end
    end
    redirect_to lista_tareas_path
  end

  private

  def tarea_params
    return params#.require(:tarea).permit(:titulo, :hecha)
  end

  # def init_lista_tareas
  #   @lista_tareas = [
  #     {:id => 1, :titulo => 'Comprar boli azul con tinta roja que pinte de verde', :hecha => false},
  #     {:id => 2, :titulo => 'Hacer ajo atao', :hecha => true},
  #     {:id => 3, :titulo => 'Practicar a tirar aviones de papel desde el quinto', :hecha => false},
  #     {:id => 4, :titulo => 'Patentar algo, lo que sea', :hecha => false},
  #   ]
  # end

end
