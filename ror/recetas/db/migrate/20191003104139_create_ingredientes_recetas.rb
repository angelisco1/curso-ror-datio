class CreateIngredientesRecetas < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredientes_recetas do |t|
      t.references :ingrediente, null: false, foreign_key: true
      t.references :receta, null: false, foreign_key: true
      t.string :cantidad

      t.timestamps
    end
  end
end
