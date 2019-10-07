class IngredientesController < ApplicationController


  def index
    @ingredientes = Ingrediente.all.includes(:categoria).joins(:categoria)
  end

  def edit
    # ingredientes = ActiveRecord::Base.connection.execute("SELECT ingredientes.*, categorias.nombre as categoria_nombre FROM ingredientes INNER JOIN categorias ON categorias.id = ingredientes.categoria_id")
    # # puts "ING: #{ingredientes.map do |r| Ingrediente.new(r)end}"
    # ingredientes.map do |r|
    #   puts "REC: #{r}"
    #   n = {nombre: r.delete("categoria_nombre")}
    #   i = Ingrediente.new(r)
    #   puts i
    #   puts n
    # end

    @ingrediente = Ingrediente.con_categorias.find(params[:id])
    @categorias = Categoria.all.pluck([:nombre, :id])
  end

  def update
    @ingrediente = Ingrediente.find(params[:id])
    if @ingrediente.update ingrediente_params
      redirect_to ingredientes_path
    else
      flash[:errors] = @ingrediente.errors.full_messages
      redirect_to new_ingrediente_path
    end
  end


  private
    def ingrediente_params
      params.require(:ingrediente).permit(:nombre, :categoria_id)
    end
end
