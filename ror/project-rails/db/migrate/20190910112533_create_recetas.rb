class CreateRecetas < ActiveRecord::Migration[6.0]
  def change
    create_table :recetas do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :puntuacion
      t.boolean :publica

      t.timestamps
    end
  end
end
