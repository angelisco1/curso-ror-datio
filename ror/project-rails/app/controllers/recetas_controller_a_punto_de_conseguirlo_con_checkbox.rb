class RecetasController < ApplicationController

  def index
    @recetas = Receta.all
  end

  def show
    # @receta = Receta.find(params[:id])
    # @receta = Receta.includes(:usuario, ingredientes: [:categoria]).find(params[:id])
    @receta = Receta.includes(:usuario, ingredientes: [:categoria]).find(params[:id])
  end

  def new
    @receta = Receta.new
    @receta.ingredientes_recetas.build
  end

  def create
    @receta = Receta.new receta_params.merge({:puntuacion => 0})

    puts "RECE: #{@receta.attributes}"
    if @receta.save
      redirect_to recetas_path
    end
  end

  def edit
    @receta = Receta.includes(:ingredientes, :ingredientes_recetas => [:ingrediente]).find params[:id]
  end

  def update
    @receta = Receta.find params[:id]
    puts "RECE: #{@receta.attributes}"
    puts "RECE: #{receta_params}"
    p = ingredientes_recetas_params

    ingredientes_recetas = receta_params.to_h["ingredientes_recetas_attributes"].select{|key, value| value.has_key?(:ingrediente_id)}#.map{|k, v| v}#.inject([]){|acc, (key, value)| acc << value}
    puts "INGREC: #{ingredientes_recetas}"

    nuevos_ing_rec = []
    ingredientes_recetas.each do |k, v|
      nuevos_ing_rec << v
    end
    puts "NUEVOS: #{nuevos_ing_rec}"

    # @receta.ingredientes_recetas = ingredientes_recetas
    if @receta.update receta_params.delete("ingredientes_recetas_attributes")
      redirect_to recetas_path
    end
    # if @receta.update receta_params
    #   redirect_to recetas_path
    # end
  end

  def destroy
    @receta = Receta.find params[:id]
    @receta.destroy
    redirect_to recetas_path
  end

  private
  def receta_params
    puts "------- PARAMS: #{params}"
    params.require(:receta).permit(:nombre, :descripcion, :publica, ingredientes_recetas_attributes: [:cantidad, :id, :ingrediente_id, :pertenece])
  end

  def ingredientes_recetas_params
    p = params[:receta][:ingredientes_recetas_attributes]

    puts "------- PIPPPOOOOOO: #{p}"
    p
  end
  # TODO: https://learn.co/lessons/has-many-through-forms-rails
  # https://thoughtbot.com/blog/accepts-nested-attributes-for-with-has-many-through
  # https://stackoverflow.com/questions/13506735/rails-has-many-through-nested-form

end
