class CategoriasController < ApplicationController
  before_action :authenticate_usuario!, except: :index
  before_action :is_admin?, except: :index
  before_action :cambiar_ingredientes_de_categoria, only: :destroy

  def index
    @categorias = Categoria.all
  end

  def new
    @categoria = Categoria.new
  end

  def create
    @categoria = Categoria.new categoria_params
    if @categoria.save
      redirect_to categorias_path
    end
  end

  def edit
    puts "ID a EDITAR: #{params[:id]}"
    @categoria = Categoria.find params[:id]
  end

  def update
    @categoria = Categoria.find params[:id]
    if @categoria.update categoria_params
      redirect_to categorias_path
    end
  end

  def destroy
    @categoria = Categoria.find params[:id]
    @categoria.destroy
    redirect_to categorias_path
  end

  private
  def categoria_params
    # params es parecido a un Hash
    # El método require comprueba que tiene una clave :categoria en el Hash, y si no la tiene entonces devuelve un error.
    # El método permit devuelve una copia de los parámetros del objeto devolviendo solo aquellas claves => valor que le hemos pasado como parámetro
    puts "Params: #{params}"
    permitidos = params.require(:categoria).permit(:nombre)
    puts "Permitidos: #{permitidos}"
    return permitidos
  end

  def cambiar_ingredientes_de_categoria

    @categoria = Categoria.includes(:ingredientes).find(params[:id])
    # puts "***************** 1"
    # @categoria = Categoria.includes(:ingredientes).where(id: params[:id]).first
    # puts "***************** 2"
    # @categoria = Categoria.where(id: params[:id]).includes(:ingredientes).first
    # puts "***************** 3"
    ids = @categoria.ingredientes.map{|c| c.id}
    Ingrediente.cambiar_categoria ids, Categoria.find_by(:nombre => 'Desconocida').id
  end
end
