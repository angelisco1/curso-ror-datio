class AddCategoriaIdToIngredientes < ActiveRecord::Migration[6.0]
  def change
    c = Categoria.create({nombre: 'Desconocida'})

    add_reference :ingredientes, :categoria, null: false, foreign_key: true, default: c.id
  end
end
