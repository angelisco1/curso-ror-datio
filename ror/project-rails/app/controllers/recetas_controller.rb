class RecetasController < ApplicationController
  include RecetasHelper

  before_action :authenticate_usuario!, except: [:index, :show]
  # before_action :is_the_owner?, only: [:edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do |controller|
    # if !is_the_owner? params[:id]
    if !is_the_owner? Receta.con_usuario.find(params[:id])
      redirect_to root_path
    end
  end

  def index
    if usuario_signed_in?
      # Usuario.includes(:recetas).where(id: current_usuario.id, recetas: {publica: false})
      # # @recetas = Receta.includes(:usuario).where(publica: true) + Receta.includes(:usuario).where(usuario: current_usuario, publica: false)
      @recetas = Receta.con_usuario.publicas + Receta.con_usuario.de_usuario(current_usuario).privadas
    else
      # @recetas = Receta.includes(:usuario).where(publica: true)
      @recetas = Receta.con_usuario.publicas
    end
  end

  def show
    # @receta = Receta.find(params[:id])
    # @receta = Receta.includes(ingredientes: [:categoria]).find(params[:id])
    # @receta = Receta.includes(:usuario, ingredientes: [:categoria]).find(params[:id])
    @receta = Receta.con_usuario.con_ingredientes_y_categorias.find(params[:id])
  end

  def recetas_usuario
    @usuario = Usuario.find(params[:id])
    # @recetas = Receta.con_usuario.where(usuario: @usuario, publica: true)
    @recetas = Receta.con_usuario.de_usuario(@usuario).publicas
  end

  def new
    @receta = Receta.new
  end

  def create
    @receta = Receta.new receta_params.merge({:puntuacion => 0, :usuario => current_usuario})
    # @receta = Receta.new receta_params.merge({:puntuacion => 0})

    if @receta.save
      creados = IngredientesReceta.crear_ingredientes_recetas @receta, ingredientes_recetas_params
      if creados
        redirect_to recetas_path
      end
    end
  end

  def edit
    @receta = Receta.includes(:ingredientes, :ingredientes_recetas => [:ingrediente]).find params[:id]
  end

  def update
    @receta = Receta.find params[:id]

    if @receta.update receta_params
      actualizados = IngredientesReceta.actualizar_ingredientes_recetas ingredientes_recetas_params.select{|ing_rec| ing_rec.has_key?(:id) && ing_rec[:cantidad] != ""}

      eliminados = IngredientesReceta.eliminar_ingredientes_recetas ingredientes_recetas_params.select{|ing_rec| ing_rec.has_key?(:id) && ing_rec[:cantidad] == ""}.map{|ing_rec| ing_rec[:id]}

      creados = IngredientesReceta.crear_ingredientes_recetas @receta, ingredientes_recetas_params.reject{|ing_rec| ing_rec.has_key?(:id)}

      if creados && actualizados && eliminados
        redirect_to recetas_path
      end
    end
  end

  def votar
    @receta = Receta.find(params[:id])
    @receta.puntuacion += params[:vota].to_i
    if @receta.save
      redirect_to receta_path(@receta)
    end
  end

  def destroy
    @receta = Receta.find params[:id]
    if @receta.destroy
      redirect_to recetas_path
    end
  end

  private

  def all_params
    params.require(:receta).permit(:nombre, :descripcion, :publica, ingredientes_recetas_attributes: [:cantidad, :id, :ingrediente_id])
  end

  def receta_params
    r_params = all_params
    r_params.delete("ingredientes_recetas_attributes")
    r_params
  end

  def ingredientes_recetas_params
    # ingredientes_seleccionados = all_params["ingredientes_recetas_attributes"].select{|k, v| v["cantidad"] != ""}#
    # .values
    # puts "****ING SELEC: #{ingredientes_seleccionados}"
    all_params["ingredientes_recetas_attributes"].to_h.select{|k, v| v["cantidad"] != "" || v.has_key?("id")}.values#.map{|v| IngredientesReceta.new v}
  end
  # TODO: https://learn.co/lessons/has-many-through-forms-rails
  # https://thoughtbot.com/blog/accepts-nested-attributes-for-with-has-many-through
  # https://stackoverflow.com/questions/13506735/rails-has-many-through-nested-form

  # Ahora está en un HELPER
  # def is_the_owner?
  #   if current_usuario != Receta.find(params[:id]).usuario
  #     redirect_to root_path
  #   end
  # end
end
