class CategoriasController < ApplicationController
  # before_action :categoria_params, only: :create

  def index
    # puts "JEJEJEJEJEJEJ8 #{I18n.locale}"
    @categorias = Categoria.all
  end

  # def show
  #   puts "PARAMS: #{params}"
  #   @categoria = Categoria.find(params[:id])
  # end

  def new
    @categoria = Categoria.new
  end

  def create
    @categoria = Categoria.new categoria_params
    if @categoria.save
      redirect_to categorias_path
    else
      flash[:errors] = @categoria.errors.full_messages
      redirect_to new_categoria_path
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def update
    @categoria = Categoria.find(params[:id])
    if @categoria.update categoria_params
      redirect_to categorias_path
    else
      flash[:errors] = @categoria.errors.full_messages
      redirect_to new_categoria_path
    end
  end

  def destroy
    @categoria = Categoria.find(params[:id])
    if @categoria.destroy
      redirect_to categorias_path
    end
  end

  private
    def categoria_params
      params.require(:categoria).permit(:nombre)
    end
end
