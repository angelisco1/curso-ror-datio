class AddCategoriaRefToIngredientes < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredientes, :categoria, foreign_key: true
  end
end
