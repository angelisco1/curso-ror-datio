module CategoriasHelper
  def categorias_select_options
    Categoria.all.map{|categoria| [categoria.nombre, categoria.id]}
  end
end
